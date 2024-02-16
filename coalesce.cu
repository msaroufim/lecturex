__global__ void copyDataNonCoalesced(float *in, float *out, int n) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < n) {
        // Access pattern might not be coalesced depending on the index calculation
        out[index] = in[(index * 2) % n]; // Example of a non-coalesced access
    }
}


__global__ void copyDataCoalesced(float *in, float *out, int n) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < n) {
        // Ensure coalesced memory access by accessing consecutive memory addresses
        out[index] = in[index]; // Direct 1-to-1 mapping ensures coalesced access
    }
}
