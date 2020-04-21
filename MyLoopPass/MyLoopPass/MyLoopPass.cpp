#include <iostream>
#include <string>
#include <vector>

#include "llvm/ADT/APInt.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "mylooppass"

namespace {
  int NumLoops = 0; // "Number of loops");
  // int NumLoopNests = 0; // "Number of loop nests");
  // int NumNormalizedLoops = 0; // "Number of normalized loops");
  // int NumPerfectLoops = 0; // "Number of perfect loops");

  inline std::string to_str(bool in) {
    return in ? "yes" : "no";
  }

  class MyLoopPass: public LoopPass {
  public:
    static char ID; // Pass identification, replacement for typeid
    MyLoopPass() : LoopPass(ID) {}

    void getAnalysisUsage(AnalysisUsage &AU) const override;
    bool runOnLoop(Loop *loop, LPPassManager &LPM) override;
  };

  // Returns nestedness level of a loop, 1 for one loop
  int getLoopLevels(const Loop *loop) {
    int levels = 1;
    int maxSubLooplevels = 0;
    for (auto &subloop: loop->getSubLoops()) {
        maxSubLooplevels = std::max(maxSubLooplevels, getLoopLevels(subloop));
    }
    return levels + maxSubLooplevels;
  }

  // Returns true if and only if every loop has one subloop and the only
  bool isPerfectNest(const Loop *loop) {
    // TODO: make simplify CFG work - merge or remove redundant blocks
    if (loop->getBlocks().size() == 1) {
      return true;
    }
    if (loop->getSubLoops().size() != 1) {
      return false;
    }
    return isPerfectNest(*loop->begin());
  }

  // Returns true if and only if all the loops in this nest are normalized:
  // Induction variable starts at 0 an increments by 1
  bool isNormalized(const Loop *loop, ScalarEvolution &SE) {
    if (!loop->getCanonicalInductionVariable()) {
      return false;
    }
    // if (!loop->isCanonical(SE)) {
    //   return false;
    // }
    for (auto &subloop: loop->getSubLoops()) {
      return isNormalized(subloop, SE);
    }
    return true;
  }

  // Checks every level for the rectangularity of the induction variable,
  // assumes the perfection of the nest had been checked
  bool isRectangularPolyhedron(const Loop *loop, ScalarEvolution &SE) {
    int nSubLoops = loop->getSubLoops().size();
    if (!loop->getBounds(SE) || nSubLoops > 1) {
      return false;
    }
    if (nSubLoops == 0) {
      return true;
    }
    return isRectangularPolyhedron(*loop->begin(), SE);
  }

  void MyLoopPass::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.setPreservesAll();
    AU.addRequired<LoopInfoWrapperPass>();
    AU.addRequired<ScalarEvolutionWrapperPass>();
  }

  bool MyLoopPass::runOnLoop(Loop *loop, LPPassManager &LPM) {
    ScalarEvolution &SE = getAnalysis<ScalarEvolutionWrapperPass>().getSE();

    // Process loop nests only
    if (loop->getParentLoop()) {
        return false;
    }

    errs() << "Loop " << NumLoops++ << ": ";
    errs() << "levels=" << getLoopLevels(loop);
    errs() << ", perfect nest=" << to_str(isPerfectNest(loop));
    errs() << ", normalized=" << to_str(isNormalized(loop, SE));
    errs() << ", rectangular polyhedron="
           << to_str(isRectangularPolyhedron(loop, SE));
    errs() << "\n\n";

    return false;
  }

  char MyLoopPass::ID = 0;
  static RegisterPass<MyLoopPass> X("mylooppass",
    "Loop info: depth, perfect and normalized", true, true);
}
