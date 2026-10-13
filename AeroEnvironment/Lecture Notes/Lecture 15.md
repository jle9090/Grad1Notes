14 was found shot dead in a ditch (slides were not posted)

holy shit there are so many coordinate systems

# Mag field in space
- as we get further into space, dipole (multipole) field model breaks down
- field is heavly distorted by solar wind
	- the solar wind carries particles (dynamic pressure) and drags the inerplnatary magnetic field (IMF)
- ![[Pasted image 20261013083507.png]]
	- here, IMF happens to be in the southward direction
	- solar wind plasma, there will be a reconnection where there is a anti parallel connectoin
		- ![[Pasted image 20261013083548.png]], here, there will be reconnection
		- dominated by protons?
		- also where the magnetopause is located
				- 
		  $$
		  \begin{gathered}
		  \rho_{SW} \approx 5~\mathrm{\frac{ions}{cm^3}} \\
		  V_{sw} \approx 400~\mathrm{\frac{km}{s}} \\
		  B_{sw} \approx 5~ionT \\
		  B_{0} = 31000~\mathrm{\mu T} \\
		  B_{mag} - B_{0}\left( \frac{R_{E}}{r} \right)^3 \\
		  \frac{B_{sw}^2}{2\mu_{0}} + \rho_{sw}V_{sw}^2 = \frac{(2B)^2}{2\mu_{0}} + \frac{1}{2}\rho_{mag}V^2 \\
		  \text{can assume } \frac{1}{2}\rho_{mag}V^2 = 0 \\
		  \text{can assume } \frac{B_{sw}^2}{2\mu_{0}} = 0 \\
		  \therefore \rho_{sw}V_{sw}^2 = \frac{4B_{mag}^2}{2\mu_{0}L^6} \\
		  \text{here sove for L...} \\
		  \text{MP at } L = 10
		  \end{gathered}
		  $$
![[Pasted image 20261013084232.png]]
![[Pasted image 20261013084240.png]],  MP about 10 earth radii

![[Pasted image 20261013084301.png]], $B_{sw}$ is southward


![[Pasted image 20261013084439.png]]
Geosynchronus $\approx 6.6$ 

there is difference in Geosynchronous vs Geostationary
- geostationary has 0 inclination

somewhere in the bowshock, there is a magnetosheath

sheat, then pause, then mantle, then lobe

lobes are where plasma are depleted, open field lines

dayside reconnection, nightside reconnetoin

what if solar wind is not southward?
- then there is less reconnection
- it is not as effective
- *what is being reconnected???*
- in high latitude region, there is much less reconnection
mag field in solar wind is wobbling, does not stay in south or north for a long time (except for CMEs)
- some components are anti parallel, therefore reconnections

![[Pasted image 20261013085043.png]]

![[Pasted image 20261013085415.png]]
nasa goddard space flight center

*if poles shift and northward wind does that lead to better reconnection?*

![[Pasted image 20261013085831.png]]

# Charged particle motion in magnetic field
- there is always gyration and lorentz force
$$
\begin{gathered}
\vec{F} = q(\vec{v}\times \vec{B}) \\
\vec{V}\times \vec{B} = \begin{bmatrix}
\hat{x}& \hat{y}& \hat{z} \\
V_{x} & V_{y} & V_{z}  \\
B_{x} & B_{y} & B_{z}
\end{bmatrix} \\
\frac{d^2V_{x}}{dt^2} + \left( \frac{qB_{0}}{m} \right)^2V_{x} = 0 \\
\left( \frac{qB_{0}}{m} \right)^2V_{x}, \omega_{c} = \frac{qB_{0}}{m} \\
V_{x} = A\cos(\omega_{c}t) \\
V_{x} = -A\sin(\omega_{c}t)
\end{gathered}
$$

Gyromation
$$
V_{x}(t) = V_{\perp}\cos(\omega_{c}t) \\
V_{y}(t) = -V_{\perp}\sin(\omega_{c}t) \\
V_{z}(t) = V_{\parallel} \\
\\
x(t) = \frac{V_{\perp}}{\omega_{c}}\sin(\omega _{c}t) + x_{0}\\
y(t) = \frac{V_{\perp}}{\omega_{c}}\cos(\omega _{c}t) + y_{0} \\
\\
\frac{V_{\perp}}{\omega_{c}} = r_{g} = \frac{V_{\perp}m}{qB_{0}}\\
\text{gyro radious, lamar radius, cyclotron}
$$

![[Pasted image 20261013091150.png]]
gyrating depends on the energy

![[Pasted image 20261013091324.png]]

![[Pasted image 20261013091453.png]]

$$
\begin{gathered}
\tan(\alpha) = \frac{V_{\perp}}{V_{\parallel}} \\
\text{at equator, pitch angle is 90 degrees,parallel is equal to 0, only have circulation motion}\\
\text{if } V_{\perp} = 0 \text{ than pitch angle is 0, only have parallel motion}
\end{gathered}
$$
energy is conserved and velocity does not change, no force applied

"mirror point"
- parallel velocity goes to zero

![[Pasted image 20261013092033.png]]

$$
\begin{gathered}
\vec{M} = N I A \\
\mu = \frac{KE_{\perp}}{B} = \frac{\frac{1}{2}mV_{\perp}^2}{B} = \text{const} \\
\frac{\frac{1}{2}mV_{\perp_{1}}^2}{B_{1}} = \frac{\frac{1}{2}mV_{\perp_{2}}^2}{B_{2}} \\
\frac{\sin^2(\alpha_{1})}{B_{1}} = \frac{\sin^2(\alpha_{2})}{B_{2}} \\
\text{where } \sin^2(\alpha_{2}) = 1 \text{at the mirror point}\\
\therefore \sin^2(\alpha_{1}) = \frac{B_{1}}{B_{2}}
\end{gathered}
$$

3 motions, gyro motion, bounce motion, drift motion

gyro motion can average it about guiding center

![[Pasted image 20261013092624.png]]
fuck just look at the slide for this one
$F = qE$
$v_{d} = \frac{q \vec{E} \times \vec{B}}{qB^2}$
$v_{d} = \frac{\vec{E} \times \vec{B}}{B^2}$

![[Pasted image 20261013093329.png]]

![[Pasted image 20261013093444.png]]
electro jets can increase the altitude of the plasma

graident B and curvture drift
- charge dependent and energy dependent

electrons drift eastward, protons drift westwards