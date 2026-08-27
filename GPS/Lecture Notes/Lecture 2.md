Positioning
* PNT
* implies want to know where it is
* timing not the most important usually
Navigation
* present and real time
* implies being known onboard, 
Guidance
- what path leads to destination
- does not tell where are, indicate where to go
- kind of don't care where you are
Control
- make vehicle follow desired path

Our focus in Positioning and Navigation

How do we navigate?
- landmark
	- something that you can recognize that can be related to a map
		- triangulation - based on angular measurements to lanmarks
		- ranging base on distance measurements
		- issue is when you can't see a landmark
- dead recokining
	- knowing where you start and keep track of direction
	- errors build up
- Earth and maps

Celestial navigation
* measurement of altitude of stars/planets
* think the startrekkers

Inertial navigation
- set of 3 accel measuering specific foce acting n each of 3 orth directions
- accurate compensatoin for gravity in the integration is critical
- requires set of gyros to keep platform stable or isolated
- INS is a dead reckoning system
	- drift in accel and gyro lead to errors
	- requires position fixes (occasional or even frequent)

Radio Navigation
- discovery of waves led to wireless comms
- radar and radio navigation
- freqs to transmit EM signals
	- travel at speed of light
	- $c=299,792,459 m/s$

Radio wave propogation
* its okay if you know the propogation path
* different freqs travel differently
* Ground wave
	* VLF-MF propogate by ground wave, useful for beyond the horizon
* skywave
	* HF signals travel along ground, some reflect off ionosphere
	* Loran and Omega
* direct line ofsight - VHF and higher, really travel in straight lines
	* bent a little at shallow angles
LORAN
- long range navigation system
- LFband 90-119 kHz
- ground based hyperbolic system for marine and aviation
- ![[Pasted image 20260826132432.png|292]]
- can never jam it actually
	- very reliable in marine areas
	- wait why?
- used for 2D aircraft and ship navigation
- supplemetal air navigation (eLORAN), enhanced version where stations are synchronized
- ![[Pasted image 20260826132629.png]]
- back up system for GPS?

OMEGA
- first global radio nav system
- 10-14 kHz
- 8 stations around wrld
- giant antennas
	- 366-457 m, "valley spans" up to 3500 m
- transmit by ground wave across entire globe
- FDMA - each station transmitted 4 common CW tones + on unique freq
- dcommed in 1997

TRANSIT
- first nav sat system
- based on doppler
- users on earth surface can navigate with just doppler shifts of transmissions
- 150-400 MHz
- user motion needs to be slow or very well known


Radio Navigation Measurements
- Trilateration
	- time of arrival
	- if signal velocity is known, (c)
	- position is determined by intersection of circular lines centered on TXrs
	- must assume perfect clock for this work
- Hyperbolic positioning
	- time difference of arrival
	- reciever meausres diff in arrival time of signals from two synced TX
	- receiver doesn't care
	- positionis determined by intersection of hyperbolic lines with foci at TX pair
	- how LORAN works
- Doppler positinint - frequency shift
	- basing knowledge based on received frequency shift you get
	- when TX approaches you, freq will be higher than actual
	- at point of closest approach, doppler shift will be 0


![[Pasted image 20260826133518.png]]


$R^2 =(x_1-x)^2 + (y_1 - y)^2$
![[Pasted image 20260826133623.png]]
- taking partials
- then take derivitave of each component of x and y

![[Pasted image 20260826134059.png]]
- B's uncertainty is tangeant with O
- A as well
- C wins,
	- gives info perpendicular to O

Pseudorange
time of arrival with imperfect user clock

$$
\rho_{i}=\sqrt{ (x_{i}-x)^2+(y_{i}-y)^2 } + b
$$
book's figure has $-b$ instead of $+b$

Hyperbolic positioning in 2D
![[Pasted image 20260826134648.png]]
![[Pasted image 20260826135039.png]]

Doppler Positioning
![[Pasted image 20260826135058.png]]![[Pasted image 20260826135105.png]]

![[Pasted image 20260826135114.png]]

^ for the HW
$$
\dot{\dot{R}} = \left( \frac{V_{T}^2}{R} \right)\left( \frac{y^2}{R^2} \right)
$$

![[Pasted image 20260826135451.png]]e^ is unit vector vector pointing from TX to RX


angle measurements with respect to a known position
![[Pasted image 20260826140025.png]]
$\theta$ is elevation
$z$ is zenith angle (complementary angle)

if we know height $h$, measure zenith angle
$$
\tan(z)=\frac{x-x_{i}}{h}
$$
can also do with elevation



