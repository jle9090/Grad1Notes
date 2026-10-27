will need to screen for nans in hw6

# Signal Basics
## analog, discrete, digital
what is a signal
- *a function of one or more vairables, which repsresents a physical phenomenon*
	- we are more focused on the mathematics of the signal
- ![[Pasted image 20261026131414.png]]
	- discrete comes from sampling or from a pulse that is only present at certain intervals
	- continuous to discrete, also quantize it as levels, 
		- corresponds to how many bits used to represent the value
- ![[Pasted image 20261026131423.png]]
	- things in world are generally continuous, choose a sampling frequency
		- samples that are now indexed...
- ![[Pasted image 20261026131431.png]]
	- periodic, signal at some time t is equal to some value T where T is finite.
	- can def be a complex messy signal as long as it repeats are interval T
	- PY codes are *almost* non periodic, they repeat once a week
	- CA codes repeat every milisecond but messy with the PRN codes
Special Signals
- sinusoid
- complex exponential
- unit step
- rectengular pulse
- impulse

## Sinusoidal Signal
![[Pasted image 20261026132027.png]]
![[Pasted image 20261026132033.png]]
- typically we will work with signal with constant amplitude
![[Pasted image 20261026132036.png]]

![[Pasted image 20261026132659.png]]

![[Pasted image 20261026132706.png]]
- will work with pulses shifted away from zero

![[Pasted image 20261026132712.png]]

![[Pasted image 20261026132718.png]]

![[Pasted image 20261026133150.png]]

![[Pasted image 20261026133241.png]]

![[Pasted image 20261026133245.png]]

![[Pasted image 20261026133336.png]]

![[Pasted image 20261026133341.png]]

![[Pasted image 20261026133630.png]]

![[Pasted image 20261026133638.png]]

![[Pasted image 20261026133643.png]]
- non linear operator, + is xor, x is mixer or multiplyer
	- AND?
	- multiplying two cosines together, we get 2, the sum and the difference
$$
? = jfieow
$$
![[Pasted image 20261026134355.png]]
- front end of the GPS receiver
	- LO results in $1.585~\mathrm{GHz} - (1.585~\mathrm{GHz})$
	- coming out of the mixer as $10~\mathrm{MHz}$
	- 10 Mhz from LPF as well
![[Pasted image 20261026134651.png]]

![[Pasted image 20261026134721.png]]
- baseband vs bandpass
- bandpass - use aliasing to downconvert and sample at the same time
	- complicated apparently but done for a bunch of receivers
	- makes easier to work with digitally
	- eventally everything will eventulaly end up between 0 and f_sample/2.
		- everything present that did not get filtered out will be there...
## Analog to digital conversion
- sampling frequency must be higher than nyquist
- 1 bit a/d converters used for low cost GPS
	- why work?
		- becuase in GPS signals coming in is below thermal noise
		- what receiver does is it collects data and matches with replica
		- when doing it real time, samples are dominated by noise, signal is tiny, therefore a/d conversion can get away with 1 and a half bit sampling
	- some loss but not much
- 2 bit requires use automatic gain control (AGC), to keep samples well distributed
	- fitting measurements into sample bins, forces distribution to be some distribution to adjust sizes of bins to make that happen
- higher resolution not very useful for many applications
# Fourier series of periodic functions
![[Pasted image 20261026135525.png]]
![[Pasted image 20261026135533.png]]
![[Pasted image 20261026135650.png]]
![[Pasted image 20261026135825.png]]
![[Pasted image 20261026135830.png]]
![[Pasted image 20261026135834.png]]
![[Pasted image 20261026135839.png]]
![[Pasted image 20261026140701.png]]
- square wave - peak and valley ought to be the same, 
![[Pasted image 20261026140908.png]]
![[Pasted image 20261026140920.png]]
![[Pasted image 20261026140927.png]]
![[Pasted image 20261026140935.png]]
# Fourier transforms


# Spectrums of a PRN code