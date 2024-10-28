# noise_cancellation
Noise cancellation using Wiener filtering (two-tap FIR filter).

The figure below shows Weiner noise cancellation using a secondary sensor to measure the additive noise $v_1(n)$. 
![{F6B8CCA6-2D22-4BFD-989A-D219FF11F09A}](https://github.com/user-attachments/assets/a961bc57-33ec-4b3d-9fc9-9a2ae33e804f)

As an example, we assume the following:

![Equation](https://latex.codecogs.com/png.latex?v_1(n)=0.9v_1(n-1)+w(n)),

![Equation](https://latex.codecogs.com/png.latex?v_2(n)=-0.5v_2(n-1)+w(n)),

where $w(n)$ is zero-mean, unit-variance white noise. The signal from the signal source is given as ![x](https://latex.codecogs.com/svg.image?d(n)).

![Equation](https://latex.codecogs.com/svg.image?d(n)=\sin(0.05\pi&space;n)).

The Wiener filter approximates $x(n)$ with input $v_2(n)$ in minimum mean square error (MMSE) sense. 

## Generate and compute signals
Using the randomly generated $w(n)$, we can compute $v_1(n)$ and $v_2(n)$ following the equations above. $x(n)$ is computed by the given $d(n)$ and $v_1(n)$.

## Estimate the correlation functions to derive two-tap FIR filter
To derive FIR filter, it is needed to compute the correlation functions $r_{v_2}$ and the cross-correlation function $r_{xv_2}$. These correlation functions can be computed as follows:

![Equation](https://latex.codecogs.com/svg.image?r_{v_2}(k)=\frac{1}{N-k}\sum_{k=0}^{N-k-1}v(n&plus;k)v_2(n))

![Equation](https://latex.codecogs.com/svg.image?r_{xv_2}(k)=\frac{1}{N-k}\sum_{k=0}^{N-k-1}x(n&plus;k)v_2(n))
