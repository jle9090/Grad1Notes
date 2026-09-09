# Orbits, GNSS Constellation, Visibility

- **start problems on a seperate page for HWs.** 
- lectures 6 and 7 are recorded

# Kepler Laws
1. planets take the path of an elllipse, with the sun at one focus
2. the line joining the planet to the sun sweeps out equal areas in equal times
3. the square of the orbital period is proportional to the cube of its mean distance to the sun
![[Pasted image 20260909130716.png]]
# Two body motion of  a satellite
$$
\frac{d^2\vec{r}}{dt^2} = -\frac{\mu}{r^3}\vec{r}
$$
![[Pasted image 20260909130837.png]]

# Keplerian Elements
* size and shape of orbit
* orientation of orbit
* position within orbit

a: semi major axis
e: eccentricity

![[Pasted image 20260909131035.png]]

i: orbit inclination angle
$\Omega$: right ascension of ascending node (RAAN)
$\omega$: argument of perigee
![[Pasted image 20260909131042.png]]

$\nu$: true anomaly
u: argument of latitude $=\omega + \nu$
M: mean anamloly
E: eccentric anamoly 
![[Pasted image 20260909131047.png]]

![[Pasted image 20260909131141.png]]
Guess:
$$
E=M
$$

$$
E = \sin(E)+M
$$
![[Pasted image 20260909132108.png]]

# Gps constellation

- there are 24 sat constellation - 31 active currently (actuallt 32??)
- six orbital planes inclined at 55 deg, 4 sats per plan
- not geo synced
- semi synchronous, nearly circular orbits at $a=26560\, \mathrm{km}$
	- about twice a day, period is 11 hr 58min (sidereal day)
- redundant cesium/rubidium clocks on each sat
- antenna array pointed at Earth
- ![[Pasted image 20260909132707.png]]

![[Pasted image 20260909132718.png]]
Expandable
- actually two sats
![[Pasted image 20260909132725.png]]
![[Pasted image 20260909132918.png]]
![[Pasted image 20260909132923.png]]
* Disposal orbits
	* sats no longer actively transit are transitoned to LADO (launch and disposal operations) systems
	* when a gps sat is no longer useful, boosted to disposal orbit 500 km above constellation
	* over long term the sats will pass through operational constellation again
	* recc is to careflly circularize sat orbits are boosting but there are logistics issues
		* sims preduct non opertoinal glonass sats to cross gps sats in 40 yers
![[Pasted image 20260909133400.png]]
![[Pasted image 20260909133210.png]]

- walker constellaiton
	- way of desinign constellation with even spacing
	- within orbit planes shifted across each one, parallel
- ![[Pasted image 20260909134439.png]]

# GPS EPHEMERIDES
- control segment collects range measurements at monitoring stations
- use POD (precise orbit determination) software to estimate positoin and velocity of satellite and the ground stations that are tracking them, and clocks
- big giant kalman filter making these estimates
- ![[Pasted image 20260909134606.png]]
- to use sats in real time, we need positions in real time
- control segment takes the orbits and predict it forward 6 months, fix a set of parameters and then come down from sat into receiver
- control segment estimates orbits, takes estimaes fits a set of parameters (quasi keplerian paramterization that best fit orbit for 2 hour segments) that is what comes down
	- toe - time of ephemeris
	- IODE - issue of data ephemeris
	- keplerian elements
	- 2 drift rates and correction to mean motion
	- 6 coefficients for harmonic corrections
![[Pasted image 20260909134844.png]]almanac good for quick visibility calculations
sp3 - sp3 files
IGS will be defined as truth for this class

![[Pasted image 20260909135324.png]]
sqrt of semi major axis bc in 1978, transmitting the sqrt sucked walnut![[Pasted image 20260909135331.png]]![[Pasted image 20260909135336.png]]![[Pasted image 20260909135343.png]]
need to use the WGS84 constants for best results
![[Pasted image 20260909135349.png]]
![[Pasted image 20260909140126.png]]
![[Pasted image 20260909140136.png]]
![[Pasted image 20260909140145.png]]
