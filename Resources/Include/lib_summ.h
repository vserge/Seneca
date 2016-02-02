/*
 * MATLAB Compiler: 4.18 (R2012b)
 * Date: Fri Jan 22 14:05:05 2016
 * Arguments: "-B" "macro_default" "-W" "lib:lib_summ" "-T" "link:lib" "-d"
 * "D:\MATLAB\19.01.15\lib_summ\src" "-w" "enable:specified_file_mismatch" "-w"
 * "enable:repeated_file" "-w" "enable:switch_ignored" "-w"
 * "enable:missing_lib_sentinel" "-w" "enable:demo_license" "-v"
 * "D:\MATLAB\19.01.15\summ.m" 
 */

#ifndef __lib_summ_h
#define __lib_summ_h 1

#if defined(__cplusplus) && !defined(mclmcrrt_h) && defined(__linux__)
#  pragma implementation "mclmcrrt.h"
#endif
#include "mclmcrrt.h"
#ifdef __cplusplus
extern "C" {
#endif

#if defined(__SUNPRO_CC)
/* Solaris shared libraries use __global, rather than mapfiles
 * to define the API exported from a shared library. __global is
 * only necessary when building the library -- files including
 * this header file to use the library do not need the __global
 * declaration; hence the EXPORTING_<library> logic.
 */

#ifdef EXPORTING_lib_summ
#define PUBLIC_lib_summ_C_API __global
#else
#define PUBLIC_lib_summ_C_API /* No import statement needed. */
#endif

#define LIB_lib_summ_C_API PUBLIC_lib_summ_C_API

#elif defined(_HPUX_SOURCE)

#ifdef EXPORTING_lib_summ
#define PUBLIC_lib_summ_C_API __declspec(dllexport)
#else
#define PUBLIC_lib_summ_C_API __declspec(dllimport)
#endif

#define LIB_lib_summ_C_API PUBLIC_lib_summ_C_API


#else

#define LIB_lib_summ_C_API

#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_lib_summ_C_API 
#define LIB_lib_summ_C_API /* No special import/export declaration */
#endif

extern LIB_lib_summ_C_API 
bool MW_CALL_CONV lib_summInitializeWithHandlers(
       mclOutputHandlerFcn error_handler, 
       mclOutputHandlerFcn print_handler);

extern LIB_lib_summ_C_API 
bool MW_CALL_CONV lib_summInitialize(void);

extern LIB_lib_summ_C_API 
void MW_CALL_CONV lib_summTerminate(void);



extern LIB_lib_summ_C_API 
void MW_CALL_CONV lib_summPrintStackTrace(void);

extern LIB_lib_summ_C_API 
bool MW_CALL_CONV mlxSumm(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[]);



extern LIB_lib_summ_C_API bool MW_CALL_CONV mlfSumm(int nargout, mxArray** s, mxArray* a, mxArray* b);

#ifdef __cplusplus
}
#endif
#endif
