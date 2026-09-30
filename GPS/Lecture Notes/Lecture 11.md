![[Pasted image 20260930130500.png]]
- c1c is the c/a code
- c2l, civil code on l2, narrow band, better features in code structure than c/a code, transmitted at lower power vs c/a code
- receivers that dont have access to p code can
- cross correlate l1 and l2 to pick up or pull of the PY code and track it
	- cant decode it but can still track
	- cross correleation processing
		- noisier but effective
- c2w should be availible for all satellites

![[Pasted image 20260930131113.png]]
- get different delays on reciever side and transmiter side
	- time at which signal leaves and arrives
	- signal comes in at front end of reciever
	- signal can be delayed by hardware, bias
	- shouldn't vary a lot
	- typically a fixed bias
		- not the same on the L1 and L2 channels
	- difference on receier side doesnt matter compared to timing receiver
	- as long as we use same combination on all sat tracked, would just look like a clock error
	- clock bias being applied is based on assumed combination of L1 and L2 (on the homework)
		- these clock corrections, a0,a1,etc, corresponds to iono free solutoin of p1 and p2
	- if using c/a code and p2....there's a different bias coming off the satellite
		- what IGS does and control segment, make measurements at knonw locations with stable clocks
		- estimate each gnss sat what the differential code bias is for anything we seek to track
			- seen in figure above

![[Pasted image 20260930131754.png]]

![[Pasted image 20260930131759.png]]

for NSIT, zd = 2.0 meters....

![[Pasted image 20260930131938.png]]
- notice a depdendce on sat elevation angle
- less elevatin, higher delay
- also depends on time of day
- for whole pass, notice lack of symmetry
	- depends on how active the ionpshere is in that reigion (add this to HW write up)
- calculate local time, take actual longitude, convert to a time out of 24 hours
	- greenwhich = 0
	- 15 degrees east should be hour ahead of utc

![[Pasted image 20260930132416.png]]
- locatoin used for NIST is the right answer
	- any diff is measurement error or satellite error
	- next for positioning,NIST correctin should be zero
	- then try initizlizing with wrong answer, see if it brings to right answer

![[Pasted image 20260930132628.png]]
- both get bigger at low elevation
![[Pasted image 20260930132714.png]]
$\frac{c}{1.023*10^6}~\mathrm{\frac{chips}{\sec}}$
$\frac{C}{N_{0}}$ signal to noise ratio, more like, carrier to noise spectral density
- no units or dB

![[Pasted image 20260930133543.png]]
- box car filter
	- avg over ceratin amount of data, running average
	- blue is more multipath than trackig noise
	- red is the rough tracking noise
- hatch filter
	- comobination of code and carrier measurements
	- i know carrier can track changes in ranges
		- create smooth version of pseudorange
		- take average of each pseudorange over time
		- pick a reference time, start pseudorange at some time here, at every time past that, take each pseudorange and propogate back to reference time using carrier phase at that time
	- done in some receivers
![[Pasted image 20260930134125.png]]
- ![[Pasted image 20260930134407.png]]
- relativity depends only on the satellite, not affected by observer locatoin
- applying relativity, function of satellite orbit Eccentricity
- offset between ionoL2 and ionoL5
	- this is from a DCB (difference in code bias)
	- could be from the receiver
	- could be satellite specific bias?
		- can tell by running it for a bunch of other satellites
		- if same, reciever bias, if different, because of satellite, can look up these satellite biases prior
- things are clustered around 60 meters
	- receiver clock bias
	- NIST receiver has a 60 meter bias between antenna and receiver (cable bias)
![[Pasted image 20260930135554.png]]
![[Pasted image 20260930135826.png]]
![[Pasted image 20260930135948.png]]

