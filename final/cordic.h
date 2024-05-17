#include <ap_fixed.h>

typedef ap_fixed<32,12> FIXED_POINT;

void cordic_rotator(FIXED_POINT cos, FIXED_POINT sin, FIXED_POINT *mag, FIXED_POINT *theta);

