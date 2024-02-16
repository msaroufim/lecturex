__global__ void processArrayWithDivergence(int *data, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        if (data[idx] % 2 == 0) {
            data[idx] = data[idx] * 2; // Operation for even numbers
        } else {
            data[idx] = data[idx] + 1; // Operation for odd numbers
        }
    }
}

__global__ void processArrayWithoutDivergence(int *data, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        int isEven = !(data[idx] % 2); // 1 for even, 0 for odd
        data[idx] = isEven * (data[idx] * 2) + (!isEven) * (data[idx] + 1);
    }
}
