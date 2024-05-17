#include "hls_stream.h"
#include "fir_filter.h"

void fir_filter(int* input_real, int* input_imag, int kernel_real[KERNEL_SIZE], int kernel_imag[KERNEL_SIZE],
		        hls::stream<int>& output_real_stream, hls::stream<int>& output_imag_stream, int length) {

    for (int i = 0; i < length; i++) {
        int accum_real = 0;
        int accum_imag = 0;


        for (int k = 0; k < KERNEL_SIZE; k++) {
            #pragma HLS UNROLL factor=5
            int index = i - k;
            if (index >= 0) {
                accum_real += kernel_real[k] * input_real[index] - kernel_imag[k] * input_imag[index];
                accum_imag += kernel_real[k] * input_imag[index] + kernel_imag[k] * input_real[index];

            }
        }

        output_real_stream.write(accum_real);
        output_imag_stream.write(accum_imag);


    }
}
