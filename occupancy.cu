

__global__ void computeKernel(float* input, float* output, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        float value = input[idx];
        // A simple computation, for demonstration purposes
        output[idx] = value * value;
    }
}


// https://leimao.github.io/blog/CUDA-Occupancy-Calculation/
// Assume an optimal block size found through experimentation or the CUDA Occupancy Calculator
#define BLOCK_SIZE 256 // Example optimal block size

__global__ void computeKernelOptimized(float* input, float* output, int N) {
    int idx = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    if (idx < N) {
        // Simplified computation to reduce register usage
        float value = input[idx];
        output[idx] = sqrt(value);
    }
}
