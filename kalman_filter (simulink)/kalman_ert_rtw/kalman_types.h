/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: kalman_types.h
 *
 * Code generated for Simulink model 'kalman'.
 *
 * Model version                  : 2.5
 * Simulink Coder version         : 26.1 (R2026a) 20-Nov-2025
 * C/C++ source code generated on : Fri Apr 24 20:58:57 2026
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-M
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef kalman_types_h_
#define kalman_types_h_
#include "rtwtypes.h"
#include "stm_timer_ll.h"
#ifndef struct_tag_UOXQtCdCIhhqoqMk507iRF
#define struct_tag_UOXQtCdCIhhqoqMk507iRF

struct tag_UOXQtCdCIhhqoqMk507iRF
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  TIM_Type_T* TimerHandle;
};

#endif                                 /* struct_tag_UOXQtCdCIhhqoqMk507iRF */

#ifndef typedef_stm32cube_blocks_TimerCapture_T
#define typedef_stm32cube_blocks_TimerCapture_T

typedef struct tag_UOXQtCdCIhhqoqMk507iRF stm32cube_blocks_TimerCapture_T;

#endif                             /* typedef_stm32cube_blocks_TimerCapture_T */

/* Forward declaration for rtModel */
typedef struct tag_RTM_kalman_T RT_MODEL_kalman_T;

#endif                                 /* kalman_types_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
