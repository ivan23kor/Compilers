int foo(float *a, float *b, float *c, int n) {
    // Level 1
    for (int i = 0; i < n; ++i) {
        a[i] = b[i] + c[i];
    }
    // Level 2
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            a[i] = b[j] + c[i];
        }
    }
    // Level 3
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            for (int k = 0; k < n; ++k) {
                a[i] = b[j] + c[k];
            }
        }
    }
    // Not normalized, iteration space is not a rectangular polyhedron
    for (int i = 0; i < n; ++i) {
        for (int j = i; j < n; ++j) {
            a[i] = b[i] + c[j];
        }
    }
    // Not normalized, iteration space is a rectangular polyhedron
    for (int i = 1; i < n; ++i) {
        a[i] = b[i] + c[i];
    }
    // Normalized, iteration space is a rectangular polyhedron
    for (int i = 0; i < n; ++i) {
        a[i] = b[i] + c[i];
    }
    return a[n - 1];
}
