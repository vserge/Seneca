/*
 * MATLAB Compiler: 4.18 (R2012b)
 * Date: Thu Jan 21 17:01:48 2016
 * Arguments: "-B" "macro_default" "-W" "lib:lib_react" "-T" "link:lib" "-d"
 * "D:\MATLAB\19.01.15\lib_react\src" "-w" "enable:specified_file_mismatch"
 * "-w" "enable:repeated_file" "-w" "enable:switch_ignored" "-w"
 * "enable:missing_lib_sentinel" "-w" "enable:demo_license" "-v"
 * "D:\MATLAB\19.01.15\PDE_conc.m" "D:\MATLAB\19.01.15\pressure.m" 
 */

#ifndef __lib_react_h
#define __lib_react_h 1

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

#ifdef EXPORTING_lib_react
#define PUBLIC_lib_react_C_API __global
#else
#define PUBLIC_lib_react_C_API /* No import statement needed. */
#endif

#define LIB_lib_react_C_API PUBLIC_lib_react_C_API

#elif defined(_HPUX_SOURCE)

#ifdef EXPORTING_lib_react
#define PUBLIC_lib_react_C_API __declspec(dllexport)
#else
#define PUBLIC_lib_react_C_API __declspec(dllimport)
#endif

#define LIB_lib_react_C_API PUBLIC_lib_react_C_API


#else

#define LIB_lib_react_C_API

#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_lib_react_C_API 
#define LIB_lib_react_C_API /* No special import/export declaration */
#endif

extern LIB_lib_react_C_API 
bool MW_CALL_CONV lib_reactInitializeWithHandlers(
       mclOutputHandlerFcn error_handler, 
       mclOutputHandlerFcn print_handler);

extern LIB_lib_react_C_API 
bool MW_CALL_CONV lib_reactInitialize(void);

extern LIB_lib_react_C_API 
void MW_CALL_CONV lib_reactTerminate(void);



extern LIB_lib_react_C_API 
void MW_CALL_CONV lib_reactPrintStackTrace(void);

extern LIB_lib_react_C_API 
bool MW_CALL_CONV mlxPDE_conc(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[]);

extern LIB_lib_react_C_API 
bool MW_CALL_CONV mlxPressure(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[]);



extern LIB_lib_react_C_API bool MW_CALL_CONV mlfPDE_conc();

extern LIB_lib_react_C_API bool MW_CALL_CONV mlfPressure(int nargout, mxArray** f, mxArray* T);

#ifdef __cplusplus
}
#endif
#endif
