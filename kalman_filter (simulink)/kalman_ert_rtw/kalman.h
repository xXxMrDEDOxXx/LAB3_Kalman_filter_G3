/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: kalman.h
 *
 * Code generated for Simulink model 'kalman'.
 *
 * Model version                  : 2.2
 * Simulink Coder version         : 26.1 (R2026a) 20-Nov-2025
 * C/C++ source code generated on : Fri Apr 24 19:30:29 2026
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-M
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef kalman_h_
#define kalman_h_
#ifndef kalman_COMMON_INCLUDES_
#define kalman_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "math.h"
#endif                                 /* kalman_COMMON_INCLUDES_ */

#include "kalman_types.h"
#include "MW_target_hardware_resources.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWExtModeInfo
#define rtmGetRTWExtModeInfo(rtm)      ((rtm)->extModeInfo)
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                (&)
#endif

/* user code (top of header file) */
#include "hc_sr04.h"

/* Block signals (default storage) */
typedef struct {
  real_T pos_hatcm;                    /* '<Root>/Gain2' */
  real_T vel_hatcms;                   /* '<Root>/Gain3' */
  real32_T raw;                        /* '<Root>/raw' */
} B_kalman_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  stm32cube_blocks_TimerCapture_T obj; /* '<Root>/Timer Capture' */
  real_T x_hat[2];                     /* '<Root>/Kalman Filter 2 state' */
  real_T P[4];                         /* '<Root>/Kalman Filter 2 state' */
  real_T Q[4];                         /* '<Root>/Kalman Filter 2 state' */
  real_T R;                            /* '<Root>/Kalman Filter 2 state' */
  real_T A[4];                         /* '<Root>/Kalman Filter 2 state' */
  real_T B[2];                         /* '<Root>/Kalman Filter 2 state' */
  real_T C[2];                         /* '<Root>/Kalman Filter 2 state' */
  boolean_T doneDoubleBufferReInit;    /* '<Root>/Kalman Filter 2 state' */
} DW_kalman_T;

/* Real-time Model Data Structure */
struct tag_RTM_kalman_T {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block signals (default storage) */
extern B_kalman_T kalman_B;

/* Block states (default storage) */
extern DW_kalman_T kalman_DW;

/* Model entry point functions */
extern void kalman_initialize(void);
extern void kalman_step(void);
extern void kalman_terminate(void);

/* Real-time Model object */
extern RT_MODEL_kalman_T *const kalman_M;
extern volatile boolean_T stopRequested;
extern volatile boolean_T runModel;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'kalman'
 * '<S1>'   : 'kalman/Kalman Filter 2 state'
 */
#endif                                 /* kalman_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
