// Ryan Joseph Talalai
// CMPEN417 SP24
// 22 March 2024

#include "fpga417_lab4.h"

void fpga417_fir(int *input, int *filter, int *output, int size) {
    #pragma HLS INTERFACE m_axi port=input depth=256 offset=slave
    #pragma HLS INTERFACE m_axi port=filter depth=3 offset=slave
    #pragma HLS INTERFACE m_axi port=output depth=256 offset=slave
    #pragma HLS INTERFACE s_axilite port=size
    #pragma HLS INTERFACE s_axilite port=return

	for (int n = 0; n < size; n++) {

		output[n] = 0;

	    for (int k = 0; k < FILTER_LENGTH; k++) {
	        if (n + k < size) {
	            output[n] += input[n + k] * filter[k];
	        }
	    }
	}
}
