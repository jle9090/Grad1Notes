
# Error Models
- noise vs bias
	- noise average to zero, quickly varying
	- bias persistent cannot be averaged out
- 3 catagories of gps errors
	- errors that can be correceted through control segment uploaded, sv clock, orbit
	- errors assoc with propgoation medium (iono, tropo)
	- receiver biases, noise and interferecne near receiver
# Control Segment Errors
- sats broadcast orbitla parmaeters and clock eror rmodel
- these models:
	- ground based station measurements
	- super kalman filter to compute curent SV potisio, velocity, clock errors
	- model generate ephem and clock params to be uploaded to sats
	- sats broadcast the params in nav message
- reliability
	- error sin current values and predicted values
	- errors grow in time
	- ephem and clock error RMS specs: ~3m

# SIS SPS Specifications
- https://www.gps.gov/gps-performance

![[Pasted image 20260921131055.png]]


# Ephem Error Componenets
![[Pasted image 20260921131257.png]]
All errors do not contribute equally
only ephem errors matter, are the ones that project onto the line of sight 
- radial erorr are biggest
- ones on horizon, less from the radial 

![[Pasted image 20260921131308.png]]
- calculate global average for users across the Earth with weighted sums

# Emperical Data
- ephem error in computed range based on info in broadcast message
- compared to precise ephem are availible from IGS
- plot is base don differece between range computed using broadcast adn IGS sp3
- ![[Pasted image 20260921131732.png]]

![[Pasted image 20260921131742.png]]


# Ionospheric Effects

## GPS Signal propogation
- gps signalsare refracted in atmosphere
- bending is small for most rays
- change in speed of propogation affects psuedorange and phase measurements
- net effect as a delay

$$
\Delta \tau = \tau - \tau_{vacuum} = \frac{1}{c} \int_{s}^R{(n(l)-1)dl}
$$
![[Pasted image 20260921132137.png]]
speed of light is dependent on medium's refractive index

## Ionosphere
- region of atmosphere
- chracterized as a wekly ionize plasma
- 50 km to 1000km
- caused by solar radiaion (EUV, Xray), partially ionizes atmosphere
- affects radio wave propogation
	- refraction, diffraction, reflection faraday rotation, absorption
	- effect depedns on radio frequency
- ![[Pasted image 20260921132341.png]]
- ionospheir electron density is function of altitude, time or day, season etc, 
- ![[Pasted image 20260921132530.png]]


![[Pasted image 20260921132805.png]]
![[Pasted image 20260921132810.png]]

hori shitto
![[Pasted image 20260921133255.png]]

![[Pasted image 20260921133453.png]]
- just sending carier signal, can see phase velocity
- phase velocity, how fast is signal advancing as it travels through medium
![[Pasted image 20260921133631.png]]
![[Pasted image 20260921133858.png]]


transmit on 2 frequencies to make corrections

![[Pasted image 20260921133959.png]]
![[Pasted image 20260921134156.png]]
$\rho_{1} = \rho_{{L_{1}}}$ for reference

![[Pasted image 20260921134625.png]]
![[Pasted image 20260921134816.png]]
![[Pasted image 20260921135025.png]]
![[Pasted image 20260921135252.png]]