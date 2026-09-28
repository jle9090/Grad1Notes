**Multipathing**
- asignal that arrives at the antenna by an indirect path
- always delayed relative to direct signal
- **diffuse** multipath results from rough surface reflections, noiselike
- **specular** mulipath results from smooth surfaces
	- causes osciallatios in pseudorange, phase, snr data
- **specular reflection** mirror like reflectionof light from a surface
	- in which light from an incoming direction is reflected into a single outgoing direction

- fresnel threshold
	- what determines smoothness and reflections for gps signals


![[Pasted image 20260928130242.png]]

- gps signals are RHCP
	- rotates once per wavelength every ~20cm
	- receiver is preferntial to that direction
		- part of that is defnese for multipath
		- multipath results in LHCP
		- if you attentuate LHCP signals from below, great way to avoid multipaht

![[Pasted image 20260928130535.png]]
- can get multpath from
	- edge surfaces of the roof
	- from below antenna
	- most antennas come with a backplane
	- at shllow angles can still get refelctions into antenna pattern
![[Pasted image 20260928130637.png]]
- notice that there is correlation
	- cant exactly tell it is multipath
- notice that on the LH graph, they are periodic
	- these are repeating every day
	- repeats 4 minutes earlier each day
		- this is due to multipathing?
	- if it repeats every day earlier by 4 minutes, it is environmental factors?

![[Pasted image 20260928130925.png]]
- SNRs showing oscillation, useful for HW4?
- can see multipath effect in pseudorange measurement
- 

![[Pasted image 20260928130905.png]]
- multipath obserable pseudorange (Left axis)
- see how they move forward 4 minutes a day

if aligning them by 236 seconds a day
![[Pasted image 20260928131204.png]]
- notice the systematic effect

**Avoiding and reducing multipath**
- antenna based mititgaions
	- rhcp vs lhcp
	- ground planes
	- choke rings
	- ![[Pasted image 20260928131323.png]]
	- choke ring has a path delay to cancel out on the side, high elevation cutoffs
- siting - install gps sites away from reflecting materials
- improved receiver technology
	- narrow correlatoar spacing (explained at a later time)
- signal and data processing
	- smoothing
	- correlation in time

![[Pasted image 20260928131544.png]]
- uss eisenhower
	- multipathing from ocean and ship
	- also radar antennas etc were competing for space
- churchhill
	- multipathing from rocks
- crbt
	- truck, fence
- if looking at IGS data, can see multipath observable from sites
![[Pasted image 20260928131713.png]]

![[Pasted image 20260928131817.png]]
- how does multipath affect things?

![[Pasted image 20260928131904.png]]
- end up tracking the signal by...

![[Pasted image 20260928132108.png]]
- if addition to signalthere is also a indirect signal
	- refleted signals come in later than the correct, comes in delayed and attenuated
	- correlation being measured:
		- leading edge is fine, trailing edge is distorted

Tracking the peak
- aquisiion passes peak information to tracking
- in tracking, goal is to know where the peak is, relates to start of C/A code
- typically calculate 3 correlatoin values

![[Pasted image 20260928132433.png]]
- when seeking peak correlation
- dont look for the highest prompt signal
- we seek some kind of discriminator
	- early-late correlator

![[Pasted image 20260928132515.png]]
- able to track some error in delta of direct and composite, 
- $\tau_m$ is between direct and composite
- $\delta$ is delay in meters
- $\psi$ is phase delay
- $\alpha$ is amplitude?

![[Pasted image 20260928132828.png]]

- what receive tracks is the composite signal
- phase multipath angle
- shows up as error in tracking phase
- shows up as error in tracking SNR

![[Pasted image 20260928133124.png]]
![[Pasted image 20260928133232.png]]
![[Pasted image 20260928133312.png]]
- leading edge is clean
- trailing edge is goofy
- negaitve section ins graph 3 is out of phase by 180 degrees

![[Pasted image 20260928133522.png]]

![[Pasted image 20260928133529.png]]
- as reflector gets farther away, larger tracking errors (~15 meters)
- notice C/A code vs P code
	- P is 10MHz?, is 10x smaller, can discard anything 45 meters away
		- why L5 signal is great (higher chipping rate)

for a fixed antenna in a static environement, repeats on a daily basis, shifting in time due to difference between solar day and sidereal day (2 gps sat orbits)

oscillaiton frequncy is related to reflector distance

**combining observations to see pseudorange multipath**
- there is multipath on psuedorange carrier phase and SNR obserables
- multipath error on pseudo range is severl orders of magnitude larget than multipath on phase
- ![[Pasted image 20260928134423.png]]
- $\rho_{L1}$ is pseudorange
- $\epsilon$ is tracking noise
- ![[Pasted image 20260928134616.png]]
$\epsilon_{p_{1}}$ and $MP_{1}$ is small enough to ignore?
this is a way to characterize multipath, not remove it

