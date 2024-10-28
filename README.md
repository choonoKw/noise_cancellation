# noise_cancellation
Noise cancellation using Wiener filtering

The figure below shows Weiner noise cancellation using a secondary sensor to measure the additive noise $v_1(n)$. 
![{F6B8CCA6-2D22-4BFD-989A-D219FF11F09A}](https://github.com/user-attachments/assets/a961bc57-33ec-4b3d-9fc9-9a2ae33e804f)

As an example, we assume the following:

![Equation](https://latex.codecogs.com/png.latex?v_1(n)=0.9v_1(n-1)+w(n)),

![Equation](https://latex.codecogs.com/png.latex?v_2(n)=-0.5v_2(n-1)+w(n)),

where $w(n)$ is zero-mean, unit-variance white noise. The signal from the signal source is given as 

![Equation](https://latex.codecogs.com/svg.image?d(n)=\sin(0.05\pi&space;n)).

The Wiener filter approximates $x(n)$ with input $v_2(n)$ in minimum mean square error (MMSE) sense. 

## Generate random signals
Using the randomly generated $w(n)$, we can compute $v_1(n)$ and $v_2(n)$ following the equations above. Additionally, 
