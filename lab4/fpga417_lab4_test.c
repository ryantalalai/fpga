// Ryan Joseph Talalai
// CMPEN417 SP24
// 22 March 2024

#include <stdio.h>
#include "fpga417_lab4.h"

int main() {

    // Inputs
	int input[] = {1, 2, 3, 4, 5, 6, 7, 8};
	int filter[FILTER_LENGTH] = {3, 5, 3};

	int output[sizeof(input) / sizeof(input[0])];
	int size = sizeof(input) / sizeof(input[0]);

	// Expected output
	int expected_output[] = {22, 33, 44, 55, 66, 77, 61, 24};

	fpga417_fir(input, filter, output, size);

    int pass = 1;
    for (int i = 0; i < size; i++) {
        if (output[i] != expected_output[i]) {
            pass = 0;
            printf("Mismatch at index %d: Expected %d, Got %d\n", i, expected_output[i], output[i]);
        }
    }

    if (pass) {
        printf("Test Passed.\n");
    } else {
        printf("Test Failed.\n");
    }

    return 0;
}
