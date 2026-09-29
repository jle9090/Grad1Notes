# **Radio wave propogation**

## Plasma oscillations
- plasma is neutral usually
- if impsing an electric field, ions are dragged one way, electrons the other way
	- if E field flips direction, this results in oscillations
- if it **does not** change, then it will stay that way

$$
\begin{gathered}
E = \frac{q_{e} n_{e} x}{\epsilon_{0}} \\
E = \frac{\sigma}{\epsilon_{0}} \\
ma = F = q_{e}E \\
m_{e}\frac{dV}{dt}=m_{e}\frac{d^2 x}{dt} = -\frac{q_{e}^2 n_{e}}{\epsilon_{0}}x \\
\frac{d^2 x}{dt} + \frac{q_{e}^2 n_{e}}{m_{e} \epsilon_{0}} = 0 \\
\omega_{p} = \sqrt{\frac{q_{e}^2 n_{e}}{m_{e} \epsilon_{0}}} \\
= \alpha \sqrt{n_{e}} \\
\\
\text{EM wave:} \\
v_{p} = \frac{c}{n} \\
\omega = 2\pi f \text{ radio wave frequency} \\
n^2 = 1-\frac{\omega_{p}^2}{\omega^2} \\
\\
\text{at } \omega =\omega_{p}, \text{ n=0, vp approaches infinity} \\
\text{if } \omega \leq \omega_{p} , \\
n=\text{complex}\\
n=\alpha+iB
\end{gathered}
$$


## Plasma frequency
- $\omega_p$ directly related to electron density
- radio waves above $\omega_{p}$ pass through ionosphere with some loss
	- electrons cannot respond fast enough, still have oscilations
- radio waves below $\omega_{p}$are refelced, electrons are shakend and re radiate
- implications
	- must use frequencies above $\omega_{p}$ to communicate with satellites
	- can communicate over the horizon with frequneices near/below $\omega_{p}$

## over the horizon radar or communication
- theres a pictrure here hes drawing its all over

## index of refraction from maxwell's equation
$$
\begin{gathered}
\text{Snell's Law}\\
n_{i}\sin(\theta_{i}) = n_{r}\sin(\theta_{r}) \\
\text{where } n_{1} \text{ and } n_{2} \text{are index of refraction}
\end{gathered}
$$

- we can treat inosphere as successive layes, aand look at refractin from one layer to next
	- continuous refraction
- end results: ray "bends" and turns back to the ground
	- **not a hard reflection**

$n^2 = 1- \frac{\omega_{p}^2}{\omega^2}$

**critical frequencies**
- F region
	- $f_c \approx 3-30~\mathrm{MHz}$
	- fc is critical frequencies
- E region
	-  $f_c \approx 1-2~\mathrm{MHz}$
	- but sporadic E increases up to $100~\mathrm{MHz}$
- D region
	- simple model breaks
	- $n^2 = 1- \frac{\omega_{p}^2}{\omega^2}$ 
	- lots of neutrals means high collision frequeunce, more energy absoption, idex of refractions is more complicated
	- absorption of MHz waves
	- refelction of waves below ~100 kHz, VLF waves (below 50 kHz), used for long range comms with submarines

## waves in plasmas
need 3 equations to describe wave propogation in cold plasma, faradday, amperes, 
$$
\begin{gathered}
\nabla \times \vec{B} = \mu_{0}\vec{J} + \mu_{0}\epsilon_{0} \frac{d \vec{E}}{dt} \to \frac{d}{dt} \to j\omega \\

\nabla \times \vec{E} = \frac{d \vec{B}}{dt} \to \vec{\nabla }x \to j \vec{k}x \to k= \frac{2\pi}{\lambda} \\
\\
\text{langevin equation simply Fma} \\
m_{e}\frac{d \vec{V_{e}}}{dt} = \Sigma \vec{F} = q_{e} \vec{E} + q_{e}(\vec{V} \times \vec{B})+ v m_{e} V_{e} \\
\text{v is collision frequency} \\
\end{gathered}

$$

(insert big evil equaiton (Appleton Hartree equation) here)
![[Pasted image 20260929091952.png]]
## absoroption
D region absportion
- as electrons gt excited by waves with f < fc, they collide with neurtrals, some of the EM wave energy gets transferred to heat; radio waves suffers stronger absorption
- how much absorption?
	- he's drawing another diagram ...
	- 

## MUF, LUF, X ray effect