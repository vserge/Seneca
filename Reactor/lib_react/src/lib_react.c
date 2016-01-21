/*
 * MATLAB Compiler: 4.18 (R2012b)
 * Date: Thu Jan 21 17:01:48 2016
 * Arguments: "-B" "macro_default" "-W" "lib:lib_react" "-T" "link:lib" "-d"
 * "D:\MATLAB\19.01.15\lib_react\src" "-w" "enable:specified_file_mismatch"
 * "-w" "enable:repeated_file" "-w" "enable:switch_ignored" "-w"
 * "enable:missing_lib_sentinel" "-w" "enable:demo_license" "-v"
 * "D:\MATLAB\19.01.15\PDE_conc.m" "D:\MATLAB\19.01.15\pressure.m" 
 */

#include <stdio.h>
#define EXPORTING_lib_react 1
#include "lib_react.h"

static HMCRINSTANCE _mcr_inst = NULL;


#if defined( _MSC_VER) || defined(__BORLANDC__) || defined(__WATCOMC__) || defined(__LCC__)
#ifdef __LCC__
#undef EXTERN_C
#endif
#include <windows.h>

static char path_to_dll[_MAX_PATH];

BOOL WINAPI DllMain(HINSTANCE hInstance, DWORD dwReason, void *pv)
{
    if (dwReason == DLL_PROCESS_ATTACH)
    {
        if (GetModuleFileName(hInstance, path_to_dll, _MAX_PATH) == 0)
            return FALSE;
    }
    else if (dwReason == DLL_PROCESS_DETACH)
    {
    }
    return TRUE;
}
#endif
#ifdef __cplusplus
extern "C" {
#endif

static int mclDefaultPrintHandler(const char *s)
{
  return mclWrite(1 /* stdout */, s, sizeof(char)*strlen(s));
}

#ifdef __cplusplus
} /* End extern "C" block */
#endif

#ifdef __cplusplus
extern "C" {
#endif

static int mclDefaultErrorHandler(const char *s)
{
  int written = 0;
  size_t len = 0;
  len = strlen(s);
  written = mclWrite(2 /* stderr */, s, sizeof(char)*len);
  if (len > 0 && s[ len-1 ] != '\n')
    written += mclWrite(2 /* stderr */, "\n", sizeof(char));
  return written;
}

#ifdef __cplusplus
} /* End extern "C" block */
#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_lib_react_C_API
#define LIB_lib_react_C_API /* No special import/export declaration */
#endif

LIB_lib_react_C_API 
bool MW_CALL_CONV lib_reactInitializeWithHandlers(
    mclOutputHandlerFcn error_handler,
    mclOutputHandlerFcn print_handler)
{
    int bResult = 0;
  if (_mcr_inst != NULL)
    return true;
  if (!mclmcrInitialize())
    return false;
  if (!GetModuleFileName(GetModuleHandle("lib_react"), path_to_dll, _MAX_PATH))
    return false;
    {
        mclCtfStream ctfStream = 
            mclGetEmbeddedCtfStream(path_to_dll);
        if (ctfStream) {
            bResult = mclInitializeComponentInstanceEmbedded(   &_mcr_inst,
                                                                error_handler, 
                                                                print_handler,
                                                                ctfStream);
            mclDestroyStream(ctfStream);
        } else {
            bResult = 0;
        }
    }  
    if (!bResult)
    return false;
  return true;
}

LIB_lib_react_C_API 
bool MW_CALL_CONV lib_reactInitialize(void)
{
  return lib_reactInitializeWithHandlers(mclDefaultErrorHandler, mclDefaultPrintHandler);
}

LIB_lib_react_C_API 
void MW_CALL_CONV lib_reactTerminate(void)
{
  if (_mcr_inst != NULL)
    mclTerminateInstance(&_mcr_inst);
}

LIB_lib_react_C_API 
void MW_CALL_CONV lib_reactPrintStackTrace(void) 
{
  char** stackTrace;
  int stackDepth = mclGetStackTrace(&stackTrace);
  int i;
  for(i=0; i<stackDepth; i++)
  {
    mclWrite(2 /* stderr */, stackTrace[i], sizeof(char)*strlen(stackTrace[i]));
    mclWrite(2 /* stderr */, "\n", sizeof(char)*strlen("\n"));
  }
  mclFreeStackTrace(&stackTrace, stackDepth);
}


LIB_lib_react_C_API 
bool MW_CALL_CONV mlxPDE_conc(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])
{
  return mclFeval(_mcr_inst, "PDE_conc", nlhs, plhs, nrhs, prhs);
}

LIB_lib_react_C_API 
bool MW_CALL_CONV mlxPressure(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])
{
  return mclFeval(_mcr_inst, "pressure", nlhs, plhs, nrhs, prhs);
}

LIB_lib_react_C_API 
bool MW_CALL_CONV mlfPDE_conc()
{
  return mclMlfFeval(_mcr_inst, "PDE_conc", 0, 0, 0);
}

LIB_lib_react_C_API 
bool MW_CALL_CONV mlfPressure(int nargout, mxArray** f, mxArray* T)
{
  return mclMlfFeval(_mcr_inst, "pressure", nargout, 1, 1, f, T);
}

