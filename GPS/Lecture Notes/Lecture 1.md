Advanced classes
 Prerequisite for: 
 – ASEN 6092 GNSS Remote Sensing 
 – ASEN 6091 GNSS Receiver Architecture 
 – ASEN 6090 GNSS Software and Applications

TODO: *Download the PNT books*

**Course Outline**
- GPS Basics
- Measurements and Errors
- GPS Signals and Receivers
- Applications

**Whats special**
- unpredencted accuracy
- global availibility at all times
- global prescense
	- 4 independent GNSS constellations
* many applications
* very multidisciplinary
* cost, system is paid by government
	* it is free to use
	* impossible to 'charge' someone

**GNSS**
- genereal version of 'GPS'
	- GPS - US
	- GLONASS - russia
	- Galileo - Europe
	- BeiDou - China
	- + other augmentations
		- QCS sys in Japan to operate in urban environment
			- additional signal in sky for better coverage
- coordinated to not interfere with each other
- all in MEO
- 1 way ranging by passive users
	- you only listen, do not transmit
	- many advantages

**Key requirements**
- high accuracy and precision
- 24/7 operation, any weather
	- operating indoors was previously rare
- dual use - military and civil
- self contained and passive for the user
- ![[Pasted image 20260824132754.png|372]]

**Early development**
* ![[Pasted image 20260824132939.png]]

**Disciplines Relevant**
* ranging signals
	* EM, signal processing, coding, antennas, inteference
* Satellites
	* orbits, relativity, perturbation, attitude controls, atomic clocks
* Environment
	* ionosphere, tropo, antenna installation
* Users
	* platform dynamics, challenging environments, multipathing issues
* Politics
	* spectrum usage, privacy, fees , security, national pride

**Risks**
* local interference (intentaional or unintentional)
* space weather effects
	* rapid variation in ionosphere
* incorrect/misleading signals
	* system glitch/spoofing
	* common in warzones
		* near russia, makes it looks like going in circles
		* in middle east you'll look like you're in beirut
		* signal simulators, broadcasting a constructued signal
* control system issues
	* expereicned by GLONASS and galileo
		* took things out for 24 hours
* loss of satellites

![[Pasted image 20260824133956.png]]

![[Pasted image 20260824134138.png]]

PRN - psuedorandom noise code
- tells which code is genereated by a certains at
- codes get reused
- ID for the signal being generated
SVN - satellite vehicle number
* tells what spacecraft it is
* number is not reused
![[Pasted image 20260824134852.png]]

Monitoring statations
- gps but upside down
- gc can do kalman filter to estimate orbits of gps sats
- that info is put into a navigation message, where sats can rebroadcast back down to use

Earliest adopters of GPS was surveying locations

**GPS Services**
* Standard positonin service (SPS)
	* civilian users
* Precise Positioning Serivce (PPS)
	* service for military
	* turns out civilians could position just as well as military
	* deliberately degrade civilian service
		* anti spoofing (encode the military signals)
		* fiddle around with civil signal (selected availibility)
		* but then all recievers wander the same way and then send corrections
			* differential GPS
		* May 1st, 2000
![[Pasted image 20260824140140.png]]

**Fundementals of Satellite Navigation**
* based on precise measurement of time
* contancy of speed of light
* GNSS uses *trilateration*
	* sats (TX) positions are known
	* reciever position is unknown
	* sat to reciever range meausrents are used to estimate position
* ![[Pasted image 20260824140242.png]]
Receiver than actually uses one more satellite to account for clock error (4 sats total)

4 sats
3D est location + RX clock error

Position Solution
* Solution involves an equaton with 4 unknowns
* RX POS
* RX clock correction
	* position accuracy of ~1m implies knowledge of RX clock to within ~3ns
* GPS accuracy is based almost entirely on knowing satellite orbits and satellite clocks
* Also a dat amessage modulated on rangng isgnal provides the precise location of the satellite and corrections for the satellite clock

![[Pasted image 20260824140746.png|443]]

rho - s is satellite, r is receiver
time you *think* you got the signal

![[Pasted image 20260824140759.png]]

true Range - R

thing we will try to estimate
![[Pasted image 20260824141005.png]]

**Solution Accuracy**
- Ranging Error
	- clock bias
	- environmetal effects
- Geometry
	- distribution of satellites in the sky
![[Pasted image 20260824141100.png]]