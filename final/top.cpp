#include "hls_stream.h"
#include "ap_int.h"
#include "fir_filter.h"

void fpga417_fir(int* input_real, int* input_imag, float* output_real, float* output_imag, int input_length) {

    #pragma HLS INTERFACE m_axi port=input_real depth=50 offset=slave
    #pragma HLS INTERFACE m_axi port=input_imag depth=50 offset=slave
    #pragma HLS INTERFACE m_axi port=output_real depth=50 offset=slave
    #pragma HLS INTERFACE m_axi port=output_imag depth=50 offset=slave
    #pragma HLS INTERFACE s_axilite port=input_length
    #pragma HLS INTERFACE s_axilite port=return

    #pragma HLS DATAFLOW

	// Use first 25 entries of input for KERNEL
//	int kernel_imag[KERNEL_SIZE];
//	int kernel_real[KERNEL_SIZE];
//	for (int i = 0; i < KERNEL_SIZE; i++) {
//	    kernel_real[i] = input_real[i];
//	    kernel_imag[i] = input_imag[i];
//	}

	// Fixed KERNEL
	int kernel_real[KERNEL_SIZE] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25};
	int kernel_imag[KERNEL_SIZE] = {25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1};


	hls::stream<int> imag_stream;
	hls::stream<int> real_stream;


	fir_filter(input_real, input_imag, kernel_real, kernel_imag, real_stream, imag_stream, input_length);
	top_cordic_rotator(imag_stream, real_stream, output_real, output_imag, input_length);
}
