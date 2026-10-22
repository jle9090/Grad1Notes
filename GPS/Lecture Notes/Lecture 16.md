carrier phase is smoother and not as much nosie

want more precision than what is availble with pseudorange

PPP
RTK

tracking of carrier pahse data is weakest link
- easy to interrupt
- walk by
- bump
- etc
- receier loses lock on carrier signal easily 

ambiguity resolution is also an issue

many strategies for this

![[Pasted image 20261019130802.png]]
- base station near can send range corrections to users nearby
	- cancels out sat clock error
	- orbit errors - depends on how far away the base station is
	- doesnt help too much with precision
	- multipathing could fuck it up more if not calibrated properly
- RTK
	- base station instead of sending correctoins, sends carrier phase corrections
	- essentially, we difference out errors due
	- robust approach if clear view of sky

![[Pasted image 20261019131239.png]]
- over time, points will rotate around right answer as satellites move across sky
- widelining
	- isntead of working with measurements for l1, using widelane measurement
		- difference of l1 and l2 phase, have some beat note of bigger ambiguity
		- 1 or 2 in the uncertainty bubble
	- bouneded by pseudorange solution
- figure out what carrier cycles are, detereming as interger cycles

what helps phase ambiguity
- more sats
- more frequencies
- long period of observations
![[Pasted image 20261019131850.png]]

![[Pasted image 20261019132023.png]]
- want to smooth psuedorange with carrier phase
- what causes error in pseudoranges?
	- pseudorrange is this geometric range
	- position of the satellite working with the broadcast orbit
	- *control segment handles where the phase center of the satellite tommororw*
	- there is difference between the mass center and where the antenna is 
$\epsilon_{APO}=\text{antenna phase center offset}$
- offset of where effective phase center of antenna is, diff variations depending on the signals coming in an different purposes


green line - clock error
- DCB, differenticla code biases

![[Pasted image 20261019132651.png]]
- now dont have DCB in carrier phase
- still have other errors:
- antenna phase center offsets, satellite phase bias, phase windup
- phase windup
	- receiing antenna on earth
	- signals are RHCP
	- antenna is preferential to RHCP
	- if antenna is rotated one full circle, phase increases by 2pi
	- if antenna is tilted,projection of that onto diff signals give different results

![[Pasted image 20261019132939.png]]
- newest form
- idea is: use a combo of model and processing to get high accuracy with a single gnss receiver
- using sp3 types
	- real time, the streaming services from IGS etc
	- sends out info to do it
- complicated
- user does not need to worry about infrastructure about getting all this info
- just take reciever out and can do these things
- relies on combo of
	- pseudoranges
	- caririer phase data
- diffs between multiple satellies
![[Pasted image 20261019133216.png]]
- instead of broadcast, using ultra rapid orbits 

![[Pasted image 20261019133239.png]]

![[Pasted image 20261019133533.png]]
- might have knowledge of some dynamics
- for evrery sat, need to estimate an interger for its arc
- if lose lock, need to start another arc, more vars
- high degree of correlation between arcs
	- if sat motion is fast than can do it more quickly
	- integer vs user positions

before: cancel out measurements to solve for uncertainty
single double triple differenceing
- cancels out sources of errors and ambiguities
- but needs observation data from somewhere elese

![[Pasted image 20261019133934.png]]

![[Pasted image 20261019134316.png]]
- because of the difference between sat and recievr clock present in all equations
![[Pasted image 20261019134834.png]]
- some partials and least squares like with a priori

bold -1 is the line of sight vector
![[Pasted image 20261019135034.png]]
![[Pasted image 20261019135125.png]]
- "all of this works great" - peni axl

![[Pasted image 20261019135149.png]]
- in reality, hard to get intergers
- usually get a double differenc IRL
- take differnces between the single differences for one satellite
	- or the differnce between these four carrier phase measurements

![[Pasted image 20261019135643.png]]

![[Pasted image 20261019135650.png]]

![[Pasted image 20261019135931.png]]

![[Pasted image 20261019140126.png]]
- tough thing to do with L1 by itself
	- unless pseudorange is really precise, see the low noise L5 signals
![[Pasted image 20261019140143.png]]

![[Pasted image 20261019140305.png]]
![[Pasted image 20261019140341.png]]
![[Pasted image 20261019140503.png]]
![[Pasted image 20261019140509.png]]
![[Pasted image 20261019140554.png]]
