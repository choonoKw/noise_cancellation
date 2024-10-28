# noise_cancellation
Noise cancellation using Wiener filtering (two-tap FIR filter).

The figure below shows Weiner noise cancellation using a secondary sensor to measure the additive noise $v_1(n)$. 
![{F6B8CCA6-2D22-4BFD-989A-D219FF11F09A}](https://github.com/user-attachments/assets/a961bc57-33ec-4b3d-9fc9-9a2ae33e804f)

As an example, we assume the following:
<p align="center">
  <img src="https://latex.codecogs.com/png.latex?v_1(n)=0.9v_1(n-1)+w(n)," alt="Equation">
</p>
<p align="center">
  <img src="https://latex.codecogs.com/png.latex?v_2(n)=-0.5v_2(n-1)+w(n)," alt="Equation">
</p>
where $w(n)$ is zero-mean, unit-variance white noise. The signal from the signal source is given as ![Equation](https://latex.codecogs.com/svg.image?d(n)).
<p align="center">
  <img src="https://latex.codecogs.com/svg.image?d(n)=\sin(0.05\pi&space;n)." alt="Equation">
</p>

The Wiener filter approximates $x(n)$ with input $v_2(n)$ in minimum mean square error (MMSE) sense. 

## Generate and compute signals
Using the randomly generated $w(n)$, we can compute $v_1(n)$ and $v_2(n)$ following the equations above. $x(n)$ is computed by the given $d(n)$ and $v_1(n)$.

## Estimate the correlation functions to derive two-tap FIR filter
To derive FIR filter, it is needed to compute the correlation functions $r_{v_2}$ and the cross-correlation function $r_{xv_2}$. These correlation functions can be computed as follows:
<p align="center">
  <img src="https://latex.codecogs.com/svg.image?r_{v_2}(k)=\frac{1}{N-k}\sum_{k=0}^{N-k-1}v(n&plus;k)v_2(n)," alt="Equation">
</p>
<p align="center">
  <img src="https://latex.codecogs.com/svg.image?r_{xv_2}(k)=\frac{1}{N-k}\sum_{k=0}^{N-k-1}x(n&plus;k)v_2(n)," alt="Equation">
</p>
where $N$ is the data length. The correlation matrix $R_{v_2}$ can be expressed using the relationship: 
![Equation](https://latex.codecogs.com/svg.image?(%5Cmathbf{R}_{v_2})_{ij}=r_{v_2}(|j-i|)).

The Wiener filter is $p$-tap FIR filter, where $p$ is the order of filter, whose function $h(n)$ should satisfies

<p align="center">
  <img src="https://latex.codecogs.com/svg.image?%5Cbegin{bmatrix}r_{v_2}(0)&r_{v_2}(1)&%5Ccdots&r_{v_2}(p-2)&r_{v_2}(p-1)%5C%5Cr_{v_2}(1)&r_{v_2}(0)&&&r_{v_2}(p-2)%5C%5C%5Cvdots&&%5Cddots&&%5Cvdots%5C%5Cr_{v_2}(p-2)&&&r_{v_2}(0)&r_{v_2}(1)%5C%5Cr_{v_2}(p-1)&r_{v_2}(p-2)&%5Ccdots&r_{v_2}(1)&r_{v_2}(0)%5Cend{bmatrix}%5Cbegin{bmatrix}h(0)%5C%5Ch(1)%5C%5C%5Cvdots%5C%5Ch(p-2)%5C%5Ch(p-1)%5Cend{bmatrix}=%5Cbegin{bmatrix}r_{xv_2}(0)%5C%5Cr_{xv_2}(1)%5C%5C%5Cvdots%5C%5Cr_{xv_2}(p-2)%5C%5Cr_{xv_2}(p-1)%5Cend{bmatrix}" alt="Equation">
</p>
<p align="center">
  <img src="https://latex.codecogs.com/svg.image?%5Cmathbf{R}_{v_2}%5Cmathbf{h}=%5Cmathbf{r}_{xv_2}" alt="Equation">
</p>
<p align="center">
  <img src="https://latex.codecogs.com/svg.image?\therefore\mathbf{h}=\mathbf{R}_{v_2}^{-1}\mathbf{r}_{xv_2}" alt="Equation">
</p>


