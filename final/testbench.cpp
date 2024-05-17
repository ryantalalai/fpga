#include "cordic.h"
#include "stdio.h"
#include "fir_filter.h"

int main()
{

	int input_real[25] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
	//int input_imag[25] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

	//int input_real[25] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	int input_imag[25] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};


	float output_mag[25];
	float output_phase[25];

	int length = LENGTH;

    fpga417_fir(input_real, input_imag, output_mag, output_phase, length);

    for (int i=0; i<LENGTH; i++)
    {
    	printf("output %d mag: %f phase: %f \n", i, output_mag[i], output_phase[i]);
    }

}

