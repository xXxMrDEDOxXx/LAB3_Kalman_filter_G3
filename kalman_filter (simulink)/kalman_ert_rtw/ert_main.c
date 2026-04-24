/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: ert_main.c
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

#include "kalman.h"
#include "rtwtypes.h"
#include "ext_mode.h"                  /* External mode header file */
#include "xcp.h"
#include "MW_target_hardware_resources.h"

volatile int IsrOverrun = 0;
static boolean_T OverrunFlag = 0;
void rt_OneStep(void)
{
  extmodeSimulationTime_T extmodeTime = (extmodeSimulationTime_T)0;
  extmodeErrorCode_T extmodeError = EXTMODE_SUCCESS;

  /* Check for overrun. Protect OverrunFlag against preemption */
  if (OverrunFlag++) {
    IsrOverrun = 1;
    OverrunFlag--;
    return;
  }

  __enable_irq();
  extmodeTime = (extmodeSimulationTime_T)(((kalman_M->Timing.clockTick0 * 1) + 0));
  kalman_step();

  /* Get model outputs here */
  extmodeError = extmodeEvent((extmodeEventId_T)(0), extmodeTime);
  if (extmodeError != EXTMODE_SUCCESS) {
    /* Code to handle external mode event errors may be added here */
  }

  __disable_irq();
  OverrunFlag--;
}

volatile boolean_T stopRequested;
volatile boolean_T runModel;
int main(int argc, char **argv)
{
  float modelBaseRate = 0.01;
  float systemClock = 170.0;
  extmodeErrorCode_T errorCode = EXTMODE_SUCCESS;

  /* Initialize variables */
  stopRequested = false;
  runModel = false;

#if !defined(MW_FREERTOS) && defined(MW_MULTI_TASKING_MODE) && (MW_MULTI_TASKING_MODE == 1)

  MW_ASM (" SVC #1");

#endif

  ;

  // Start Peripheral initialization imported from STM32CubeMX project;
  void MX_DMA_Init(void);
  void MX_GPIO_Init(void);
  void MX_LPUART1_UART_Init(void);
  void MX_TIM2_Init(void);
  HAL_Init();
  SystemClock_Config();
  PeriphCommonClock_Config();
  MX_DMA_Init();
  MX_GPIO_Init();
  MX_LPUART1_UART_Init();
  MX_TIM2_Init();

  // End Peripheral initialization imported from STM32CubeMX project;
  rtmSetErrorStatus(kalman_M, 0);

  /* Parse External Mode command line arguments */
  errorCode = extmodeParseArgs(0, (const char_T**)NULL);
  if (errorCode != EXTMODE_SUCCESS) {
    return errorCode;
  }

  kalman_initialize();
  __disable_irq();
  __enable_irq();

  /* External Mode initialization */
  errorCode = extmodeInit(kalman_M->extModeInfo, (extmodeSimulationTime_T *)
    rteiGetPtrTFinalTicks(kalman_M->extModeInfo));
  if (errorCode != EXTMODE_SUCCESS) {
    return errorCode;
  }

  if (errorCode == EXTMODE_SUCCESS) {
    /* Wait until a Start or Stop Request has been received from the Host */
    extmodeWaitForHostRequest(EXTMODE_WAIT_FOREVER);
    if (extmodeStopRequested()) {
      rtmSetStopRequested(kalman_M, true);
    }
  }

  __disable_irq();
  ARMCM_SysTick_Config(modelBaseRate);
  runModel =
    !extmodeSimulationComplete() && !extmodeStopRequested()&&
    !rtmGetStopRequested(kalman_M);
  __enable_irq();
  __enable_irq();
  while (runModel) {
    /* Run External Mode background activities */
    errorCode = extmodeBackgroundRun();
    if (errorCode != EXTMODE_SUCCESS && errorCode != EXTMODE_EMPTY) {
      /* Code to handle External Mode background task errors
         may be added here */
    }

    stopRequested = !(
                      !extmodeSimulationComplete() && !extmodeStopRequested()&&
                      !rtmGetStopRequested(kalman_M));
    runModel = !(stopRequested);
    if (stopRequested) {
      SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;
    }

    ;
  }

  /* Terminate model */
  kalman_terminate();

  /* External Mode reset */
  extmodeReset();

#if !defined(MW_FREERTOS) && !defined(USE_RTX)

  (void) systemClock;

#endif

  ;
  __disable_irq();
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
