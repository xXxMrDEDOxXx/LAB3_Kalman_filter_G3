/*
 * kalman.c
 *
 *  Created on: 22 เม.ย. 2569
 *      Author: POND
 */


/* kalman.c — 2-State Kalman Filter Implementation */
#include "kalman.h"

/**
 * @brief  Update Kalman matrices based on physical parameters (m, k, b)
 * @param  kf: Pointer to KalmanFilter struct
 * @param  m: Mass (kg)
 * @param  k: Spring constant (N/m)
 * @param  b: Damping coefficient (Ns/m)
 * @param  Ts: Sampling time (seconds)
 */
void Kalman_Update_Physical_Params(KalmanFilter *kf, float m, float k, float b, float Ts)
{
    if (m <= 0.0f) return; // ป้องกันการหารด้วยศูนย์

    /* 1. Calculate Continuous Matrix Ac & Bc */
    float Ac[2][2] = {
        {0.0f,      1.0f},
        {-k / m,   -b / m}
    };

    float Bc[2] = {0.0f, 1.0f / m};

    /* 2. Discretize using Euler Method: Ad = I + Ac*Ts */
    kf->A[0][0] = 1.0f + (Ac[0][0] * Ts);
    kf->A[0][1] = Ac[0][1] * Ts;
    kf->A[1][0] = Ac[1][0] * Ts;
    kf->A[1][1] = 1.0f + (Ac[1][1] * Ts);

    /* 3. Discretize Bc: Bd = Bc*Ts */
    kf->B[0] = Bc[0] * Ts;
    kf->B[1] = Bc[1] * Ts;
}

void Kalman_Init(KalmanFilter *kf)
{

    /* C matrix — measure position only */
    kf->C[0] = 1.0f;
    kf->C[1] = 0.0f;

    /* Process noise Q (2x2) */
    kf->Q[0][0] = 1e-4f;  kf->Q[0][1] = 0.0f;
    kf->Q[1][0] = 0.0f;   kf->Q[1][1] = 1e-3f;

    /* Measurement noise R */
    kf->R = 0.025f;

    /* Initial state */
    kf->x_hat[0] = 0.0f;
    kf->x_hat[1] = 0.0f;

    /* Initial covariance (identity) */
    kf->P[0][0] = 1.0f;  kf->P[0][1] = 0.0f;
    kf->P[1][0] = 0.0f;  kf->P[1][1] = 1.0f;
}

/* -------------------------------------------------------
   Kalman_Update — call every Ts = 10 ms
   y_meas : noisy position measurement [m]
   u      : force input [N]
   returns: estimated position [m]
   ------------------------------------------------------- */
float Kalman_Update(KalmanFilter *kf, float y_meas, float u)
{
    float *A = &kf->A[0][0];   /* shorthand */

    /* ---- PREDICT ---------------------------------------- */
    /* x_pred = A*x_hat + B*u */
    float xp0 = kf->A[0][0]*kf->x_hat[0] + kf->A[0][1]*kf->x_hat[1] + kf->B[0]*u;
    float xp1 = kf->A[1][0]*kf->x_hat[0] + kf->A[1][1]*kf->x_hat[1] + kf->B[1]*u;

    /* P_pred = A*P*A' + Q  (2x2 manual multiply) */
    float Pp[2][2];
    /* temp = A*P */
    float t00 = kf->A[0][0]*kf->P[0][0] + kf->A[0][1]*kf->P[1][0];
    float t01 = kf->A[0][0]*kf->P[0][1] + kf->A[0][1]*kf->P[1][1];
    float t10 = kf->A[1][0]*kf->P[0][0] + kf->A[1][1]*kf->P[1][0];
    float t11 = kf->A[1][0]*kf->P[0][1] + kf->A[1][1]*kf->P[1][1];
    /* Pp = temp*A' + Q */
    Pp[0][0] = t00*kf->A[0][0] + t01*kf->A[0][1] + kf->Q[0][0];
    Pp[0][1] = t00*kf->A[1][0] + t01*kf->A[1][1] + kf->Q[0][1];
    Pp[1][0] = t10*kf->A[0][0] + t11*kf->A[0][1] + kf->Q[1][0];
    Pp[1][1] = t10*kf->A[1][0] + t11*kf->A[1][1] + kf->Q[1][1];

    /* ---- KALMAN GAIN ------------------------------------ */
    /* S = C*Pp*C' + R  (scalar, since C=[1,0]) */
    float S = Pp[0][0] + kf->R;

    /* K = Pp*C' / S  (2x1 vector) */
    float K0 = Pp[0][0] / S;
    float K1 = Pp[1][0] / S;

    /* ---- UPDATE ----------------------------------------- */
    /* innovation = y_meas - C*x_pred */
    float innov = y_meas - xp0;

    /* x_hat = x_pred + K*innov */
    kf->x_hat[0] = xp0 + K0 * innov;
    kf->x_hat[1] = xp1 + K1 * innov;

    /* P = (I - K*C) * Pp */
    kf->P[0][0] = (1.0f - K0) * Pp[0][0];
    kf->P[0][1] = (1.0f - K0) * Pp[0][1];
    kf->P[1][0] =        -K1  * Pp[0][0] + Pp[1][0];
    kf->P[1][1] =        -K1  * Pp[0][1] + Pp[1][1];

    return kf->x_hat[0];   /* return estimated position */
}
