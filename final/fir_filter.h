#include "hls_stream.h"
#include "hls_math.h"
#include "ap_int.h"
#include "ap_fixed.h"

#define KERNEL_SIZE 25
#define LENGTH 25

void fpga417_fir(int* input_real, int* input_imag, float* output_real, float* output_imag, int input_length);

void fir_filter(int* input_real, int* input_imag, int kernel_real[KERNEL_SIZE], int kernel_imag[KERNEL_SIZE], hls::stream<int>& output_real_stream, hls::stream<int>& output_imag_stream, int length);

void top_cordic_rotator(hls::stream<int>&input_imag, hls::stream<int>&input_real,float* output_real, float* output_imag, int length);

