may want to keep track of how many NaNs are getting discarded

shape and width comes from modulation, the PRN codes, chipping rate of code
center comes from the carrier frequency
![[Pasted image 20261028130850.png]]

# Review fourier series for periodic function
![[Pasted image 20261028130906.png]]
- any signal that repeats doesnt exist at all frequency
	- cannot have power in between that repeat frequency
	- exists uh uhm
![[Pasted image 20261028131105.png]]
![[Pasted image 20261028131113.png]]
- got fourier series representaion of this...
![[Pasted image 20261028131150.png]]
![[Pasted image 20261028131211.png]]
- symmetric around zero
- can write out as multiple of some repeat frequency $f_{p}$
- duration that is non zero is $T$, the time interval
- repeat frequency is $\frac{1}{NT}$
- $f_{p}$ determines the line spacing
	- the frequencies at which there are sin cos constituents
![[Pasted image 20261028131257.png]]
- get a term for every frequency starting with $f_{p}$ and every multiple of $f_{p}$
	- $a_{n}$
- in this case the $b_n$ term is zero
- hopefully coefficents get smaller as you move out
- N is a fixed number, as n increases.....
![[Pasted image 20261028131732.png]]
- component at every multiple of $f_{p}$, a values can change, can be 0.
- certain values of n
	- when $\frac{n\pi}{N}$ is an interger, sin would be zero

![[Pasted image 20261028131942.png]]
- at x = 1,  n=N
- n=2N
- point where crosses through zero is important
- pulse of width of $1/1.23MHz *10^6*$
# fourier transforms for pulse and frequency shift
a periodic, need to use fourier transform
![[Pasted image 20261028132119.png]]
- most important one is unit pulse
	- fourier transform is the sinc function
![[Pasted image 20261028132234.png]]
![[Pasted image 20261028132430.png]]
![[Pasted image 20261028132440.png]]
$S_{dB} = 10\log_{10}S$
![[Pasted image 20261028132615.png]]
fourier transform of a lienar combonation, get same linear combo

time delay, fourier transform of that times $e^{-j_{2}\pi ft_{0}}$
![[Pasted image 20261028132713.png]]
- what does the spectrum of that look like?
- $f_{IF}$ is intermediate frequency

![[Pasted image 20261028133037.png]]
# spectrum of a prn code and gps legacy signals
![[Pasted image 20261028133057.png]]
![[Pasted image 20261028133247.png]]
- each pulse, when taking the auto correlation of within one bin has a "triangular shape"
	- triangle that happens when bits are overlapping with each other, and then linearly drops off
	- each pulse has auto correlation like that
	- in a CA code
	- alignemnt of every one of those pulses
	- multiplies by the number of pulses?

![[Pasted image 20261028133419.png]]
![[Pasted image 20261028133505.png]]
- width of main lobe is 2x the chipping rate, each side lobe is 1x the chipping rate
![[Pasted image 20261028133626.png]]

CA code is not a maximal length code
![[Pasted image 20261028133658.png]]
- easy to jam,lines are spaced wide vs higher chipping rate

![[Pasted image 20261028133758.png]]
![[Pasted image 20261028133807.png]]
this is why Py code is hard to jam, would need a wide band jammer vs C/A code

![[Pasted image 20261028134050.png]]
![[Pasted image 20261028134322.png]]
- always one extra 1 because register cant have all zeros
- there is a bias there is always one bit off compared to the rest of the code
![[Pasted image 20261028134455.png]]

![[Pasted image 20261028134550.png]]

maximal lengths:
![[Pasted image 20261028134558.png]]![[Pasted image 20261028134601.png]]

gold codes:
![[Pasted image 20261028134609.png]]

![[Pasted image 20261028134618.png]]
![[Pasted image 20261028134625.png]]
- in dB it drops to $-\infty$
- each CA code would look slightly different

![[Pasted image 20261028134713.png]]
spectrum command is hard in matlab allegedly
- pick sample rate of 50 MHz
- code chipping is ~1MHz
- 50 samples per chip
- 
![[Pasted image 20261028134728.png]]
dense because very high sample rate
when plotting, only go up to the nyquist rate
![[Pasted image 20261028135229.png]]
py code
![[Pasted image 20261028135236.png]]
indivudual line compnents correspnding to the repeat frequencies, spacing is 1 kHz
- says that GPS spectrum
- CA code: sample fast enough can see inidivudal line components

# modernized signals - BOC
![[Pasted image 20261028135612.png]]
- biggest problem
	- all constellation use the same sttrucutre, all power is centered on the carrier freqs
	- everyone transmitting in same place, parts of the spectrum where not much is being used
	- started to look for modulation techniques that could shift signal power to better utilize spectrum
		- M code (military code)
		- BOC modulation
			- creates signals that tailror to each part of the allocates spectrum
		- for civilians - L5 signal
			- in the ARNS band, 10x wider than CA code
			- signals for signal are L1 C/A 1.023 MHz, and L5 10.23 MHz
![[Pasted image 20261028135835.png]]
- honk shu
- RNSS band and ARNS band
![[Pasted image 20261028135947.png]]
- GPS primarly relies on CDMA......"codes dont interfere with each other"
- OR freqs are allocated timeslots TDMA
- FDMA - sligthly different frequencies
![[Pasted image 20261028140156.png]]
![[Pasted image 20261028140206.png]]
- Binary offset carrier
- in addition to PRN code, add a square wave/ multily in a square wave
- has a base frequency (say M code)
![[Pasted image 20261028140447.png]]
- PRN sequence
![[Pasted image 20261028140608.png]]
![[Pasted image 20261028140618.png]]
normal PRN code by itself for refernce

![[Pasted image 20261028140630.png]]

![[Pasted image 20261028140704.png]]
alpha - square wave
beta - code

![[Pasted image 20261028140840.png]]
![[Pasted image 20261028140848.png]]
- observe CA code and its side lobes
![[Pasted image 20261028141009.png]]
- boc code also changes shape of correlation function
	- makes the triangle narrower
![[Pasted image 20261028141156.png]]
![[Pasted image 20261028141230.png]]
![[Pasted image 20261028141352.png]]
![[Pasted image 20261028141402.png]]
![[Pasted image 20261028141411.png]]
