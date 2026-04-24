/*
 * kalman.h
 *
 *  Created on: 22 เม.ย. 2569
 *      Author: POND
 */

#ifndef KALMAN_H
#define  KALMAN_H

typedef struct {
    /* State estimate: x_hat[0]=position, x_hat[1]=velocity */
    float x_hat[2];

    /* Error covariance matrix (2x2 stored row-major) */
    float P[2][2];

    /* Discrete system matrices */
    float A[2][2];   /* State transition */
    float B[2];      /* Input */
    float C[2];      /* Output (measures position only) */

    /* Noise covariance */
    float Q[2][2];   /* Process noise */
    float R;         /* Measurement noise */
} KalmanFilter;

void  Kalman_Init(KalmanFilter *kf);
float Kalman_Update(KalmanFilter *kf, float y_meas, float u);
void Kalman_Update_Physical_Params(KalmanFilter *kf, float m, float k, float b, float Ts);

#endif /* KALMAN_H */
