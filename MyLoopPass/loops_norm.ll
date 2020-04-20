; ModuleID = 'loops.ll'
source_filename = "loops.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define i32 @foo(float* %0, float* %1, float* %2, i32 %3) #0 {
  %5 = icmp sgt i32 %3, 0
  %smax = select i1 %5, i32 %3, i32 0
  %wide.trip.count = zext i32 %smax to i64
  br i1 %5, label %.lr.ph, label %14

.lr.ph:                                           ; preds = %4
  br label %6

6:                                                ; preds = %.lr.ph, %13
  %indvars.iv47 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %13 ]
  %7 = getelementptr inbounds float, float* %1, i64 %indvars.iv47
  %8 = load float, float* %7, align 4
  %9 = getelementptr inbounds float, float* %2, i64 %indvars.iv47
  %10 = load float, float* %9, align 4
  %11 = fadd float %8, %10
  %12 = getelementptr inbounds float, float* %0, i64 %indvars.iv47
  store float %11, float* %12, align 4
  br label %13

13:                                               ; preds = %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %6, label %._crit_edge

._crit_edge:                                      ; preds = %13
  br label %14

14:                                               ; preds = %._crit_edge, %4
  %wide.trip.count16 = zext i32 %smax to i64
  br i1 %5, label %.lr.ph56, label %26

.lr.ph56:                                         ; preds = %14
  br label %15

15:                                               ; preds = %.lr.ph56, %25
  %indvars.iv1453 = phi i64 [ 0, %.lr.ph56 ], [ %indvars.iv.next15, %25 ]
  %wide.trip.count12 = zext i32 %3 to i64
  %exitcond1348 = icmp ne i64 0, %wide.trip.count12
  br i1 %exitcond1348, label %.lr.ph51, label %24

.lr.ph51:                                         ; preds = %15
  br label %16

16:                                               ; preds = %.lr.ph51, %23
  %indvars.iv1049 = phi i64 [ 0, %.lr.ph51 ], [ %indvars.iv.next11, %23 ]
  %17 = getelementptr inbounds float, float* %1, i64 %indvars.iv1049
  %18 = load float, float* %17, align 4
  %19 = getelementptr inbounds float, float* %2, i64 %indvars.iv1453
  %20 = load float, float* %19, align 4
  %21 = fadd float %18, %20
  %22 = getelementptr inbounds float, float* %0, i64 %indvars.iv1453
  store float %21, float* %22, align 4
  br label %23

23:                                               ; preds = %16
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1049, 1
  %exitcond13 = icmp ne i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond13, label %16, label %._crit_edge52

._crit_edge52:                                    ; preds = %23
  br label %24

24:                                               ; preds = %._crit_edge52, %15
  %indvars.iv1454 = phi i64 [ %indvars.iv1453, %._crit_edge52 ], [ %indvars.iv1453, %15 ]
  br label %25

25:                                               ; preds = %24
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1454, 1
  %exitcond17 = icmp ne i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %15, label %._crit_edge57

._crit_edge57:                                    ; preds = %25
  br label %26

26:                                               ; preds = %._crit_edge57, %14
  %wide.trip.count28 = zext i32 %smax to i64
  br i1 %5, label %.lr.ph72, label %41

.lr.ph72:                                         ; preds = %26
  br label %27

27:                                               ; preds = %.lr.ph72, %40
  %indvars.iv2669 = phi i64 [ 0, %.lr.ph72 ], [ %indvars.iv.next27, %40 ]
  %wide.trip.count24 = zext i32 %3 to i64
  %exitcond2563 = icmp ne i64 0, %wide.trip.count24
  br i1 %exitcond2563, label %.lr.ph67, label %39

.lr.ph67:                                         ; preds = %27
  br label %28

28:                                               ; preds = %.lr.ph67, %38
  %indvars.iv2264 = phi i64 [ 0, %.lr.ph67 ], [ %indvars.iv.next23, %38 ]
  %wide.trip.count20 = zext i32 %3 to i64
  %exitcond2158 = icmp ne i64 0, %wide.trip.count20
  br i1 %exitcond2158, label %.lr.ph61, label %37

.lr.ph61:                                         ; preds = %28
  br label %29

29:                                               ; preds = %.lr.ph61, %36
  %indvars.iv1859 = phi i64 [ 0, %.lr.ph61 ], [ %indvars.iv.next19, %36 ]
  %30 = getelementptr inbounds float, float* %1, i64 %indvars.iv2264
  %31 = load float, float* %30, align 4
  %32 = getelementptr inbounds float, float* %2, i64 %indvars.iv1859
  %33 = load float, float* %32, align 4
  %34 = fadd float %31, %33
  %35 = getelementptr inbounds float, float* %0, i64 %indvars.iv2669
  store float %34, float* %35, align 4
  br label %36

36:                                               ; preds = %29
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1859, 1
  %exitcond21 = icmp ne i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %29, label %._crit_edge62

._crit_edge62:                                    ; preds = %36
  br label %37

37:                                               ; preds = %._crit_edge62, %28
  %indvars.iv2265 = phi i64 [ %indvars.iv2264, %._crit_edge62 ], [ %indvars.iv2264, %28 ]
  br label %38

38:                                               ; preds = %37
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2265, 1
  %exitcond25 = icmp ne i64 %indvars.iv.next23, %wide.trip.count24
  br i1 %exitcond25, label %28, label %._crit_edge68

._crit_edge68:                                    ; preds = %38
  br label %39

39:                                               ; preds = %._crit_edge68, %27
  %indvars.iv2670 = phi i64 [ %indvars.iv2669, %._crit_edge68 ], [ %indvars.iv2669, %27 ]
  br label %40

40:                                               ; preds = %39
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv2670, 1
  %exitcond29 = icmp ne i64 %indvars.iv.next27, %wide.trip.count28
  br i1 %exitcond29, label %27, label %._crit_edge73

._crit_edge73:                                    ; preds = %40
  br label %41

41:                                               ; preds = %._crit_edge73, %26
  %wide.trip.count36 = zext i32 %smax to i64
  br i1 %5, label %.lr.ph82, label %53

.lr.ph82:                                         ; preds = %41
  br label %42

42:                                               ; preds = %.lr.ph82, %52
  %indvars.iv3079 = phi i64 [ 0, %.lr.ph82 ], [ %indvars.iv.next31, %52 ]
  %wide.trip.count34 = zext i32 %3 to i64
  %exitcond3574 = icmp ne i64 %indvars.iv3079, %wide.trip.count34
  br i1 %exitcond3574, label %.lr.ph77, label %51

.lr.ph77:                                         ; preds = %42
  br label %43

43:                                               ; preds = %.lr.ph77, %50
  %indvars.iv3275 = phi i64 [ %indvars.iv3079, %.lr.ph77 ], [ %indvars.iv.next33, %50 ]
  %44 = getelementptr inbounds float, float* %1, i64 %indvars.iv3079
  %45 = load float, float* %44, align 4
  %46 = getelementptr inbounds float, float* %2, i64 %indvars.iv3275
  %47 = load float, float* %46, align 4
  %48 = fadd float %45, %47
  %49 = getelementptr inbounds float, float* %0, i64 %indvars.iv3079
  store float %48, float* %49, align 4
  br label %50

50:                                               ; preds = %43
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv3275, 1
  %exitcond35 = icmp ne i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %43, label %._crit_edge78

._crit_edge78:                                    ; preds = %50
  br label %51

51:                                               ; preds = %._crit_edge78, %42
  %indvars.iv3080 = phi i64 [ %indvars.iv3079, %._crit_edge78 ], [ %indvars.iv3079, %42 ]
  br label %52

52:                                               ; preds = %51
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3080, 1
  %exitcond37 = icmp ne i64 %indvars.iv.next31, %wide.trip.count36
  br i1 %exitcond37, label %42, label %._crit_edge83

._crit_edge83:                                    ; preds = %52
  br label %53

53:                                               ; preds = %._crit_edge83, %41
  %54 = icmp sgt i32 %3, 1
  %smax40 = select i1 %54, i32 %3, i32 1
  %wide.trip.count41 = zext i32 %smax40 to i64
  br i1 %54, label %.lr.ph86, label %63

.lr.ph86:                                         ; preds = %53
  br label %55

55:                                               ; preds = %.lr.ph86, %62
  %indvars.iv3884 = phi i64 [ 1, %.lr.ph86 ], [ %indvars.iv.next39, %62 ]
  %56 = getelementptr inbounds float, float* %1, i64 %indvars.iv3884
  %57 = load float, float* %56, align 4
  %58 = getelementptr inbounds float, float* %2, i64 %indvars.iv3884
  %59 = load float, float* %58, align 4
  %60 = fadd float %57, %59
  %61 = getelementptr inbounds float, float* %0, i64 %indvars.iv3884
  store float %60, float* %61, align 4
  br label %62

62:                                               ; preds = %55
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3884, 1
  %exitcond42 = icmp ne i64 %indvars.iv.next39, %wide.trip.count41
  br i1 %exitcond42, label %55, label %._crit_edge87

._crit_edge87:                                    ; preds = %62
  br label %63

63:                                               ; preds = %._crit_edge87, %53
  %wide.trip.count45 = zext i32 %smax to i64
  br i1 %5, label %.lr.ph90, label %72

.lr.ph90:                                         ; preds = %63
  br label %64

64:                                               ; preds = %.lr.ph90, %71
  %indvars.iv4388 = phi i64 [ 0, %.lr.ph90 ], [ %indvars.iv.next44, %71 ]
  %65 = getelementptr inbounds float, float* %1, i64 %indvars.iv4388
  %66 = load float, float* %65, align 4
  %67 = getelementptr inbounds float, float* %2, i64 %indvars.iv4388
  %68 = load float, float* %67, align 4
  %69 = fadd float %66, %68
  %70 = getelementptr inbounds float, float* %0, i64 %indvars.iv4388
  store float %69, float* %70, align 4
  br label %71

71:                                               ; preds = %64
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv4388, 1
  %exitcond46 = icmp ne i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %64, label %._crit_edge91

._crit_edge91:                                    ; preds = %71
  br label %72

72:                                               ; preds = %._crit_edge91, %63
  %73 = sub nsw i32 %3, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float* %0, i64 %74
  %76 = load float, float* %75, align 4
  %77 = fptosi float %76 to i32
  ret i32 %77
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
