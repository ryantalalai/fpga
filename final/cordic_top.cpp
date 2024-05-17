#include "hls_stream.h"
#include "cordic.h"

void top_cordic_rotator(hls::stream<int>&input_imag, hls::stream<int>&input_real,float* output_real, float* output_imag, int length) {

	FIXED_POINT cos, sin, mag, theta;

	for (int i = 0; i < length; i++) {

		int temp_result_real = 0;
		int temp_result_imag = 0;

	    if (!input_real.empty() && !input_imag.empty()) {

	    	temp_result_real = input_real.read();
	    	temp_result_imag = input_imag.read();

	    	cos = static_cast<FIXED_POINT>(temp_result_real);
	    	sin = static_cast<FIXED_POINT>(temp_result_imag);

	        cordic_rotator(cos, sin, &mag, &theta);

	        output_real[i] = mag.to_float();
	        output_imag[i] = theta.to_float();

	        }
	    }
}
