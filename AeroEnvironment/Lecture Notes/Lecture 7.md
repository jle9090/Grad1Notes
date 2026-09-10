dont ask where 5 and 6 went

- scale height 
- homosphere, heterosphere, exosphere
- earth atmosphere visible to at least 15$R_E$
- scattering of solar Lyman-$\alpha$ (121.4 nm) from hydrogen in exosphere
- the exposphere theoretically extends to 30 $R_E$
- Moon is ~60$R_E$ away
- outer boundary of Earth's atmosphere?
- $S_{RP} = \frac{S}{c}$
	- S = $1361 \, \mathrm{\frac{W}{m^2}}$, constant at earth
	- c = speed of light
	- $\approx 4.5*10^{-6} \, \mathrm{\frac{N}{m^2}}$ 
- size H:
	- $a_0 = 5.9*10^{-11}$ m
	- $m = 1.67*10^{-27}$ kg
	- $SRP * \pi*a_0^2$
		- $\approx -10^{-26}$
- $F = mg_{0}*\frac{R_{E}}{R_{E} + 30R_{E}}^2=mg_{0}\frac{1}{31}^2$
	- $\approx 10^-29 \, \mathrm{N}$

# Atmospheric Variability
- obv how much does atmosphere vary?
- eg atmospheric density
- density depends on the altitude
- solar cycle variation
	- increase in solar EUV increases heating in atmosphere (esp thermosphere)
	- increased height => increased ionization
	- increase temp -> amosphere rises, higher thermosphere at some altitude
	- ![[Pasted image 20260910084253.png]]
	- at very low altitude, no variation?
	- we seek to understand the long term variation
	- ex: solar maximum causes orders of magnitude increase in drag from air
- Composition variation
	- ![[Pasted image 20260910084546.png]]
	- change in temp in thermo affects diffusive equalibrium of componnets
	- generally, all particles get pushed to higher altitudes by higher temps below them
	- observe the difference between solar max and min for species
		- oxygen atom is always one that dominates
		- nitrogen as well (78% is N)
		- hydrogen dominates as you increase in altitude
- GUVI (Global UV Imager) O/N2 ratio
	- ![[Pasted image 20260910084828.png]]
- Wind
	- winds in upper atmos are driven by
		1. pressure gradient, day to night
		2. coriolis force
		3. viscosity
		4. ion drag
	* different effects dominate in diff regions of atmosphere
		* altitude and latitude
	* ![[Pasted image 20260910085103.png]]
	* ![[Pasted image 20260910085109.png]]
		* each term corresponds to list above
* ![[Pasted image 20260910085232.png]]
* Tides
	* just like ocean tides
	* caused by
		* regular day night cycle in sun's heating of atosphere
		* gravitational pull of moon
		* non inear interactoins with planetary waves
		* large scale latent heat release from deep convectoins in tropics (thunderstorm)
			* any heating in one part affects other part
	* migrating tides (sun synchronous), or non-migrating
	* density falls in altitude, therefore tide amplitude increases with altitude exponentially
	* ![[Pasted image 20260910085448.png]]
* ![[Pasted image 20260910085454.png]]
	* gravity waves are not gravitational waves
* ![[Pasted image 20260910085534.png]]
* phenomonen matter
	* science, space weather will affect s/c drag, winds and tides affect O/N2 ratio affecting drag and oxygen effects
	* gavity waves break at the bottom of thermosphere
		* cause turbulence that affects height of turbopause (unverified)
* ![[Pasted image 20260910090024.png]]
* ![[Pasted image 20260910090605.png]]

# Atmospheric Effects
- ![[Pasted image 20260910090738.png]]
	- outdated as hell hail grok
- Satellite Drag
atmosphere imposes a drag force on any object
$$
\begin{gathered}
\Delta P(momentum) = P_{i} + P_{r} \\
\text{Pr is hard to calculate} \\
\Delta P(momentum) = P_{i} + (1+ P_{r}/P_{i})=P_{i}(1+f(\theta)) \\
\text{where } f(\theta) \text{ is some unknown function we don't know} \\
\Delta P(momentum)=\rho AV_{i}^2(1+f_{1}\theta)^\Delta{t} = mv_{i}(1+f((\theta))) \\
m=\rho AV_{i}\Delta t \\
AV_{i}\Delta t = \text{delta volume} \\
\text{Drag Force} \\
F_{D} = \frac{\Delta P}{\Delta t} = \rho AV_{i}^2(1+f(\theta)) \\
\boxed{F_{D} = \frac{1}{2} \rho V_{i}^2AC_{D}} \\
C_{D} = 2(1+f(\theta)) \text{drag coefficient}
C_{D} = \frac{F_{D}/A}{\frac{1}{2}\rho V_{i}^2} = \frac{\text{pressure}}{\text{dynamic pressure}} \\
\text{A is well defined} \\
\text{Vi is well determined} \\
\text{Cd is uncertain by a factor of about 2} \\
\rho \text{ is most uncertain by orders of magnitude}
\end{gathered}
$$

* Drag coefficient
	* drag coeff is hard to measure
	* ![[Pasted image 20260910092541.png]]
	* right hand side determined in  lab
	* ![[Pasted image 20260910092735.png]]
* Drag coefficent and scattering
	* depends on how molecules scatter from surfaces
		* specular (mirror reflection)
		* diffuse (scattering form opaque direction)
	* scattering related to accomodation, **measures scattering elasticity**
		* accomodation coefficent is <=1
	* ![[Pasted image 20260910092938.png]]
* Does drag make satellite speed up or slow down? 
	* speed up actually, because it is now descending
![[Pasted image 20260910093014.png]]
for a circular orbit, ergo r decreases, v increases
![[Pasted image 20260910093309.png]]
- Magnitude of drag force
	- 2 uN vs 30 N, drag vs gravity, still very significant
- Orbit Degradation
	- differentiate keplers third law to determine change in period with time (HW)
	- ![[Pasted image 20260910094016.png]]
	- period decreases with higher drag, higher area, density, altitude
		- density decreases with altitude
	- sc mass (m) reduces change in period (ballistic)
	$$
	\frac{dP}{dt} \to \frac{\Delta P}{\Delta t} = \frac{P_{i+1}-P_{i}}{\Delta t}
	$$
	![[Pasted image 20260910094154.png]]