# Least squares solution and error characterization

chunk is going to be review

## Least squares
- produces a mathemaical osluton to the graphical solution we assicate with GPS
	- intersectoion of three speheres
- provides and approx solution an an overdetermined set of pseudorange measurements that minimuzes the sum of the squares of the resiudals
	- if 4 measurements and 4 unknowns, can sometimes solve it
	- doesn't tell what to do with 5 or 6 or more measurements
		- this is what least squares will be doing
	- can do undetetermined set, irrelvant of this class
- review least squares concepts

- possible to do with quadratic equations with poor measurements
	- doesn't really give best answer
	- take these squares and compute linear corrections to that
	- assuming the guess is decent, applying small/large corrections

## least squares assumptions
- mathematical model that describes the observation (data) as a linear function of one or more parameters
	- we assume that there is a mathematical model, not ML
- observation errorrs that are zero mean and normally distributed
- our gol is the find best estimate of the unknown parmeters with observations and knowledge of their error chracteristics
![[Pasted image 20261005130953.png]]
- we assume the measurement errors we deal with are gaussianly distributed
- easily allows to combine measurements and calcualte uncertainty
- why gaussian for errors?
	- if you have something not gaussian.
	- central limit theorum:
		- if adding up a bunch of errors, they end up being gaussian
		- not valid if there are systematic errors

![[Pasted image 20261005131249.png]]
- 2nd equation: mean
![[Pasted image 20261005131309.png]]
- first example we typically see...what you see with polyfit
	- least squares estimate

![[Pasted image 20261005131452.png]]
- measurment model that any one meausremnt/all of the measurmentes will be equal to matrix A
- $A = N\times2$
- $y = N\times1$
- $\epsilon = 2\times1$

$R = \text{meas error variancee}$

![[Pasted image 20261005131953.png]]
x is states
![[Pasted image 20261005132234.png]]
habla matlab
c0(1) = m
c0(2) = b

![[Pasted image 20261005132525.png]]
![[Pasted image 20261005132747.png]]
- errors should over time average to zero...
- $\Delta x \Delta x^T$ is a 2x2
	- diagonal
	- off diagonal is co variance (graham refernce)
![[Pasted image 20261005133316.png]]
$P0$ is the covariance matrix
- uncertainty

first diagonal - is $\sigma^2$ of the slope
2nd diagonal - is $sigma^2$ of b
off diaginals are cross terms

only thing that matter is the first 2 digits
- only 2 sig fig digits for $sigma$

![[Pasted image 20261005133731.png]]

![[Pasted image 20261005133908.png]]
- residuals over the course of a day
- eyeball tests say it seems it looks pretty good

![[Pasted image 20261005133938.png]]
- something is wrong...
- somehting is systematic that is not accounted for
	- code fugged
	- spoofing
	- etc
![[Pasted image 20261005134007.png]]
- if effect you are looking for
	- plot for elevation angle, there is a bit of a trend happening
	- maybe something to watch there, even if hours passes eyeball test
	- useful to look at residuals from other sources

![[Pasted image 20261005134131.png]]
- i mean yeah
![[Pasted image 20261005134136.png]]

$$
\begin{gathered}
y=mt+b+A_{1}\cos(ft)+B_{1}\sin(ft)
\end{gathered}
$$
![[Pasted image 20261005134715.png]]
- if not all measurments coming from same sensor with same conditions
- weight matrix
- if just a little off from each other, not the biggest effects
	- weights should sum to one

![[Pasted image 20261005134814.png]]
$P_{ECEF}$ is covariance in ECEF coords, would also like to know in enu coords, $P_{ENU}$
ENV and ENU are the same coordinate frame

## Characteriing postining errors
- in nav and pos, two dimentioanl distributions are of interest for horizontal positioning
- 3d errors are also important
	- vertical directon has very different performance requirements and is specificed sperately
- normal or gaussian distribution
- scalar errors - mean, standar devaition, RMS
- 2d errors - standard deviation 2drms, CEP
- 3d errors - standard devation, SEP

![[Pasted image 20261005135417.png]]

![[Pasted image 20261005135542.png]]

![[Pasted image 20261005135712.png]]
![[Pasted image 20261005140014.png]]
