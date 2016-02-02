#include <stdio.h>
#include <stdbool.h>
//#include "lib_summ.h"

/*-----------------------------------------------------------------------*/

/* Wrapper for level 1 function exported by the MATLAB generated DLL         *
 * This function converts C data to MATLAB data, calls the MATLAB generated  *
 * function in level1.dll and then converts the MATLAB data back into C data */

int wmlfWSumm(double* out, double in1, double in2){
    
	
	*out = in1 + in2;
 
    
    return 0;
}

/*
int main(void) {
}
*/