#ifndef MATLAB_MEX_FILE
#include "stm32g4xx_hal.h"

#define TRIG_PORT GPIOA
#define TRIG_PIN GPIO_PIN_4

extern TIM_HandleTypeDef mw_tim2;

float read_ultrasonic_c(void) {
    uint32_t t1 = 0, t2 = 0;
    HAL_TIM_Base_Start(&mw_tim2);
    HAL_GPIO_WritePin(TRIG_PORT, TRIG_PIN, GPIO_PIN_SET);
    __HAL_TIM_SET_COUNTER(&mw_tim2, 0);
    while (__HAL_TIM_GET_COUNTER(&mw_tim2) < 10);
    HAL_GPIO_WritePin(TRIG_PORT, TRIG_PIN, GPIO_PIN_RESET);

    __HAL_TIM_SET_COUNTER(&mw_tim2, 0);
    while (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_0) == GPIO_PIN_RESET) {
        if(__HAL_TIM_GET_COUNTER(&mw_tim2) > 100000) return -1.0;
    }
    t1 = __HAL_TIM_GET_COUNTER(&mw_tim2);
    
    while (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_0) == GPIO_PIN_SET) {
        if(__HAL_TIM_GET_COUNTER(&mw_tim2) > 100000) return -1.0;
    }
    t2 = __HAL_TIM_GET_COUNTER(&mw_tim2);

    float distance = (float)(t2 - t1) * 0.01715;
    if (distance > 45.0) distance = 45.0;
    if (distance < 2.0) distance = 2.0;
    
    return distance;
}

#else

float read_ultrasonic_c(void) {
    return 10.0f; 
}
#endif