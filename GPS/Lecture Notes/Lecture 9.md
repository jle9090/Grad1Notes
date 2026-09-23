HW 4 notes
- kill first observation for PRN14

![[Pasted image 20260923131716.png]]

biggest effect from tropospehre adn ionosphere is the delay caused
delay is a function of index of refraction

![[Pasted image 20260923131722.png]]
There is the dry part - afected by atmospheric particles that are not water
at lower heights more effect from the water content in the air

![[Pasted image 20260923131924.png]]

## Tropspehere properties
- geneartes all weather and clouds
- shalow cover of earth
- 7-17 km thick
- 75% atmosphere mass, 99% atmosphere water vapor and aerosols
- planetary boundary layer
	- seperating turbulent atmosphere due to contat with planetary surface, above that is considered free atmosphere 
	- 200m-3km altitude
	- depends on locatoin and time

![[Pasted image 20260923132115.png]]

## Refractive Index and range error
how does presecnse of medium affect signals

![[Pasted image 20260923132137.png]]

## Basic error charachteristics
- dry gases (n2, o2) and water vapro cause gps signal refraction
	- water vapor - below 12 km, vaires with local weather, difficult to model
	- dry gases, below 16 km near equator, 9km near pole
		- contributes to 90% of troposphere refraction error. can be modeled
- is not frequency dependent
- has same effect on code and carrier (its just like an extra delay)
- error ranges from 2m to 25 m (zenith to low elevation)
- less variable than ionosphere error

![[Pasted image 20260923132537.png]]

![[Pasted image 20260923132650.png]]

![[Pasted image 20260923132835.png]]

![[Pasted image 20260923133013.png]]

![[Pasted image 20260923133250.png]]

![[Pasted image 20260923133300.png]]

![[Pasted image 20260923133514.png]]
KOKV hawaii is more humid, can see the differences there

![[Pasted image 20260923133705.png]]dont use flat surface approx: causes issues at low elevation

3rd equation: continued fraction expansion

![[Pasted image 20260923133950.png]]
also dont use OF_1 at the bottom

![[Pasted image 20260923134211.png]]

![[Pasted image 20260923134458.png]]
![[Pasted image 20260923134517.png]]

![[Pasted image 20260923134633.png]]
obsereve figure above
once gps started being around everywhere, gps receivers can be used to measure things
estimate and measure the troposphere from these observations
"tomography"

![[Pasted image 20260923134754.png]]
can also make measurements from LEO satellites
contributing to numerical weather predictions

![[Pasted image 20260923135112.png]]

