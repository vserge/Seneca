// File libwreactor.h
#ifndef LIBWREACOR_H__
#define LIBWREACOR_H__
/*
#ifdef __cplusplus extern "C" {
#endif
#ifdef _MSC_VER
#ifdef EXTERNAL_FUNCTION_EXPORT
# define EXTLIB2_EXPORT __declspec( dllexport ) #else
# define EXTLIB2_EXPORT __declspec( dllimport ) #endif
#elif __GNUC__ >= 4
/* In gnuc, all symbols are by default exported. It is still often useful,
   to not export all symbols but only the needed ones */
/*
# define EXTLIB2_EXPORT __attribute__ ((visibility("default"))) #else
# define EXTLIB2_EXPORT
#endif
EXTLIB2_EXPORT void wmlfLevel1(double** out, double in1, double in2);
#ifdef __cplusplus }
*/
int isMCRrunning();
void terminateMCR(void);
int wmlfWSumm(double** out, double in1, double in2);

#endif
