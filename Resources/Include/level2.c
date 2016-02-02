#include<stdio.h>
#include "lib_summ.h"

/* Global flag to indicate if MCR is initialized */
int MCRrunning=FALSE;

/*-----------------------------------------------------------------------*/

/* Each function wrapper should call this function first */
int isMCRrunning(){
    
    int result;
    
    if(MCRrunning){
        /*We have already initialized the MCR and initialized the MATLAB library DLL in a previous call */
        return TRUE;
    }
    else{
        /* Start the MCR */
        mclmcrInitialize();
        result = mclInitializeApplication(NULL, 0);
        
        if (!result){
            printf("Failed to initialize MCR\n");
            return result;
        }
        
        /* Initialize the MATLAB generated DLL */
        result = lib_summInitialize();
        if(!result){
            printf("Failed to initialize Library\n");
            return result;
        }
        else{
            MCRrunning=TRUE;
            return result;
        }
    }
    
}

/*-----------------------------------------------------------------------*/

/*Function to terminate the MCR*/
void terminateMCR(void) {
	MCRrunning=FALSE;
    lib_summTerminate();
	mclTerminateApplication();
    //Sometimes, repeated initialization and termination of an application may cause the application to hang. To avoid this, call mclInhibitShutdown() immediately after calling mclInitializeApplication(). For example:
	//mclInhibitShutdown();
}


/*-----------------------------------------------------------------------*/

/* Wrapper for level 1 function exported by the MATLAB generated DLL         *
 * This function converts C data to MATLAB data, calls the MATLAB generated  *
 * function in level1.dll and then converts the MATLAB data back into C data */

int wmlfLevel1(double** out, double in1, double in2){
    int nargout=1;
    
    /* Pointers to MATLAB data */
    mxArray *in1_m, *in2_m;
    mxArray *out_m = NULL;
    
    /* Start MCR, load library if not done already */
    int returnval=isMCRrunning();
    if(!returnval)
        return returnval;
    
    /* Convert C data to MATLAB data */
    /* IMPORTANT: this has to be done after ensuring that the MCR is running */
  ///  msg=mxCreateString(message);
  ///  in2d=mxCreateDoubleMatrix(size, size, mxREAL);
  ///  memcpy(mxGetPr(in2d), input2D, size*size*sizeof(double));
    
    in1_m = mxCreateDoubleScalar(in1);
    in2_m = mxCreateDoubleScalar(in2);

    /* Call the M function */
  ///  returnval=mlfLevel1(nargout, &out2d, in2d, msg);
    returnval= mlfSumm(nargout, &out_m, in1_m, in2_m);
    
    /*Convert returned  MATLAB data to C data */
    *out=(double *)malloc(sizeof(double));
    memcpy(*out, mxGetPr(out_m), sizeof(double));
    
    /* Clean up MATLAB variables */
 ///   mxDestroyArray(msg);
    mxDestroyArray(in1_m);
    mxDestroyArray(in2_m);
    mxDestroyArray(out_m);
    
    return returnval;
}
