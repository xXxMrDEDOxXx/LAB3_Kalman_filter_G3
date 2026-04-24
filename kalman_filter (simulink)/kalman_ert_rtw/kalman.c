/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: kalman.c
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

#include "kalman.h"
#include "kalman_types.h"
#include "rtwtypes.h"
#include "stm_timer_ll.h"
#include "kalman_private.h"

/* Block signals (default storage) */
B_kalman_T kalman_B;

/* Block states (default storage) */
DW_kalman_T kalman_DW;

/* Real-time model */
static RT_MODEL_kalman_T kalman_M_;
RT_MODEL_kalman_T *const kalman_M = &kalman_M_;

/* Forward declaration for local functions */
static void kalman_SystemCore_setup(stm32cube_blocks_TimerCapture_T *obj);
static void kalman_SystemCore_setup(stm32cube_blocks_TimerCapture_T *obj)
{
  TIM_Type_T b;
  boolean_T isSlaveModeTriggerEnabled;
  obj->isSetupComplete = false;

  /* Start for MATLABSystem: '<Root>/Timer Capture' */
  obj->isInitialized = 1;
  b.PeripheralPtr = TIM2;
  b.isCenterAlignedMode = false;

  /* Start for MATLABSystem: '<Root>/Timer Capture' */
  b.repetitionCounter = 0U;
  obj->TimerHandle = Timer_Handle_Init(&b);
  enableTimerInterrupts(obj->TimerHandle, 0);
  enableTimerChannel1(obj->TimerHandle, ENABLE_CH);
  isSlaveModeTriggerEnabled = isSlaveTriggerModeEnabled(obj->TimerHandle);
  if (!isSlaveModeTriggerEnabled) {
    /* Start for MATLABSystem: '<Root>/Timer Capture' */
    enableCounter(obj->TimerHandle, false);
  }

  obj->isSetupComplete = true;
}

/* Model step function */
void kalman_step(void)
{
  real_T P_pred[4];
  real_T tmp[4];
  real_T x_pred[2];
  real_T A;
  real_T A_0;
  real_T K_idx_0;
  real_T S;
  real_T tmp_1;
  real_T x_hat;
  real_T x_hat_0;
  int32_T i;
  int32_T tmp_0;
  real32_T rtb_Gain;
  real32_T rtb_Gain1;
  uint32_T channelCounts;
  uint32_T length;

  /* CCaller: '<Root>/raw' */
  kalman_B.raw = read_ultrasonic_c();

  /* Gain: '<Root>/Gain' */
  rtb_Gain = 0.01F * kalman_B.raw;

  /* Gain: '<Root>/Gain1' */
  rtb_Gain1 = 0.0F * rtb_Gain;

  /* MATLAB Function: '<Root>/Kalman Filter 2 state' */
  x_hat = kalman_DW.x_hat[1];
  x_hat_0 = kalman_DW.x_hat[0];
  for (i = 0; i < 2; i++) {
    x_pred[i] = (kalman_DW.A[i + 2] * x_hat + kalman_DW.A[i] * x_hat_0) +
      kalman_DW.B[i] * rtb_Gain1;
    tmp_0 = i << 1;
    K_idx_0 = kalman_DW.P[tmp_0];
    S = kalman_DW.P[tmp_0 + 1];
    tmp[tmp_0] = kalman_DW.A[0] * K_idx_0 + kalman_DW.A[2] * S;
    tmp[tmp_0 + 1] = kalman_DW.A[1] * K_idx_0 + kalman_DW.A[3] * S;
  }

  x_hat = kalman_DW.A[2];
  x_hat_0 = kalman_DW.A[0];
  A = kalman_DW.A[3];
  A_0 = kalman_DW.A[1];
  for (i = 0; i < 2; i++) {
    K_idx_0 = tmp[i + 2];
    S = tmp[i];
    P_pred[i] = (K_idx_0 * x_hat + S * x_hat_0) + kalman_DW.Q[i];
    P_pred[i + 2] = (K_idx_0 * A + S * A_0) + kalman_DW.Q[i + 2];
  }

  S = ((kalman_DW.C[0] * P_pred[0] + kalman_DW.C[1] * P_pred[1]) * kalman_DW.C[0]
       + (kalman_DW.C[0] * P_pred[2] + kalman_DW.C[1] * P_pred[3]) *
       kalman_DW.C[1]) + kalman_DW.R;
  K_idx_0 = (P_pred[0] * kalman_DW.C[0] + kalman_DW.C[1] * P_pred[2]) / S;
  S = (kalman_DW.C[0] * P_pred[1] + kalman_DW.C[1] * P_pred[3]) / S;
  x_hat = rtb_Gain - (kalman_DW.C[0] * x_pred[0] + kalman_DW.C[1] * x_pred[1]);
  kalman_DW.x_hat[0] = K_idx_0 * x_hat + x_pred[0];
  kalman_DW.x_hat[1] = S * x_hat + x_pred[1];
  x_hat = 1.0 - K_idx_0 * kalman_DW.C[0];
  kalman_DW.P[0] = 0.0;
  x_hat_0 = 0.0 - S * kalman_DW.C[0];
  kalman_DW.P[1] = 0.0;
  A = 0.0 - K_idx_0 * kalman_DW.C[1];
  kalman_DW.P[2] = 0.0;
  K_idx_0 = S * kalman_DW.C[1];
  kalman_DW.P[3] = 0.0;
  for (i = 0; i < 2; i++) {
    tmp_0 = i << 1;
    S = P_pred[tmp_0];
    A_0 = kalman_DW.P[tmp_0 + 1] + x_hat_0 * S;
    tmp_1 = P_pred[tmp_0 + 1];
    kalman_DW.P[tmp_0] = (x_hat * S + kalman_DW.P[tmp_0]) + A * tmp_1;
    kalman_DW.P[tmp_0 + 1] = (1.0 - K_idx_0) * tmp_1 + A_0;
  }

  /* Gain: '<Root>/Gain2' incorporates:
   *  MATLAB Function: '<Root>/Kalman Filter 2 state'
   */
  kalman_B.pos_hatcm = 100.0 * kalman_DW.x_hat[0];

  /* Gain: '<Root>/Gain3' incorporates:
   *  MATLAB Function: '<Root>/Kalman Filter 2 state'
   */
  kalman_B.vel_hatcms = 100.0 * kalman_DW.x_hat[1];

  /* MATLABSystem: '<Root>/Timer Capture' */
  getCCR1RegisterValuePollingMode(kalman_DW.obj.TimerHandle, &channelCounts,
    &length);

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The resolution of this integer timer is 0.01, which is the step size
   * of the task. Size of "clockTick0" ensures timer will not overflow during the
   * application lifespan selected.
   */
  kalman_M->Timing.clockTick0++;
}

/* Model initialize function */
void kalman_initialize(void)
{
  /* Registration code */
  rtmSetTFinal(kalman_M, -1);

  /* External mode info */
  kalman_M->Sizes.checksums[0] = (657770023U);
  kalman_M->Sizes.checksums[1] = (263848387U);
  kalman_M->Sizes.checksums[2] = (726011166U);
  kalman_M->Sizes.checksums[3] = (3872562349U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[3];
    kalman_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(kalman_M->extModeInfo,
      &kalman_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(kalman_M->extModeInfo, kalman_M->Sizes.checksums);
    rteiSetTFinalTicks(kalman_M->extModeInfo, -1);
  }

  /* SystemInitialize for MATLAB Function: '<Root>/Kalman Filter 2 state' */
  kalman_DW.P[0] = 1.0;
  kalman_DW.Q[0] = 1.0E-6;
  kalman_DW.A[0] = 1.0;
  kalman_DW.P[1] = 0.0;
  kalman_DW.Q[1] = 0.0;
  kalman_DW.A[1] = -1.051003787878788;
  kalman_DW.P[2] = 0.0;
  kalman_DW.Q[2] = 0.0;
  kalman_DW.A[2] = 0.01;
  kalman_DW.P[3] = 1.0;
  kalman_DW.Q[3] = 0.0001;
  kalman_DW.A[3] = 0.9968939393939394;
  kalman_DW.R = 0.00011482157;
  kalman_DW.C[0] = 1.0;
  kalman_DW.B[0] = 0.0;
  kalman_DW.C[1] = 0.0;
  kalman_DW.B[1] = 0.03787878787878788;

  /* Start for MATLABSystem: '<Root>/Timer Capture' */
  kalman_DW.obj.isInitialized = 0;
  kalman_DW.obj.matlabCodegenIsDeleted = false;
  kalman_SystemCore_setup(&kalman_DW.obj);
}

/* Model terminate function */
void kalman_terminate(void)
{
  /* Terminate for MATLABSystem: '<Root>/Timer Capture' */
  if (!kalman_DW.obj.matlabCodegenIsDeleted) {
    kalman_DW.obj.matlabCodegenIsDeleted = true;
    if ((kalman_DW.obj.isInitialized == 1) && kalman_DW.obj.isSetupComplete) {
      disableCounter(kalman_DW.obj.TimerHandle);
      disableTimerInterrupts(kalman_DW.obj.TimerHandle, 0);
      disableTimerChannel1(kalman_DW.obj.TimerHandle, ENABLE_CH);
    }
  }

  /* End of Terminate for MATLABSystem: '<Root>/Timer Capture' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
