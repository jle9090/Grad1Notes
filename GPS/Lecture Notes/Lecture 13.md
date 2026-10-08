Midterm info
- midterm availible on gradescope
- once downloaded, you have 24 hours to finish
- will need all the homeworks built up
- anything gathered can use, can access canvas
- open book
- try to prep earlier

![[Pasted image 20261007130930.png]]

![[Pasted image 20261007130958.png]]

![[Pasted image 20261007131016.png]]

![[Pasted image 20261007131023.png]]


$$
\begin{gathered}
\rho(x) = \text{observed psuedorange} \\
\rho(x_{0}) = \text{predicted psuedorange}
\end{gathered}
$$

![[Pasted image 20261007131314.png]]

last time did not include receiver bias in pseudoragne prev

example did not account for receiver bias in NIST HW data
- things work better if you include the clock bias term...if know clock error helps with iterations/convergeance even if it is linear

$$
\begin{gathered}
\frac{\partial\rho}{\partial x}|_{x=x_{0}} = \frac{\frac{1}{2}(2)(x^S-x)(-1)}{R} |_{x=x_{0}} \\

\frac{\partial\rho}{\partial y}|_{x=x_{0}} = \frac{-(y^S-y)}{R} |_{x=x_{0}}\\

\frac{\partial\rho}{\partial z}|_{x=x_{0}} = \frac{-z^S-z}{R} |_{x=x_{0}} \\
\\
\text{these are components of e hat}

\end{gathered}
$$
![[Pasted image 20261007131807.png]]


$$
\delta\rho^{(s)} = \text{prefit residual}
$$
all measurements are at one time epoch

![[Pasted image 20261007132204.png]]

![[Pasted image 20261007132542.png]]
why tf it look like this

relativity errors are not affected by location

![[Pasted image 20261007132952.png]]
- not very accurately at all

Questions
- what accuracy is required for initial or a priori estimate
	- a receiver can assume it is on surface of earth underneath strongest signal it finds as the initial estimate
- how does it impact the least squares solution
	- should get the same answer every time
	- should converge if there is the corret G matrix
		- if cant...solution is not observable
- when done iterating what does $\delta \rho$ look like?
	- should have some residuals
	- residuals should still make sense

![[Pasted image 20261007133457.png]]
- how good is the answer?
- can understand through the uncertainty
	- with covariance matrix
	- $\hat{x}$ is the estimate, x is truth

![[Pasted image 20261007133908.png]]
book uses G for measurment sensitvity, or H, or anything else....

![[Pasted image 20261007134109.png]]
- directly from geometry part of the matrix (G transpose G inverse matrix)
- matrix formed from us making linearized measurements
![[Pasted image 20261007134340.png]]

![[Pasted image 20261007134425.png]]
- when navigating, dont care about errors in ECEF vectors, usually use local coordinates
	- get solution into wgs84. take correction and multiply by the transformation matrix from wgs84 to ENU
	- always solve for clock as well in GPS, need to account for that clock error
![[Pasted image 20261007134624.png]]
- 

DOP is a geometrical mapping of pseudorange error to position error
- how much thingsblow up or shrink compared to pseudorange errors
- tells the uncertainty of errors

you can position with doppler as well
- range rate measurement
![[Pasted image 20261007135737.png]]
sensitivity to doppler is same G matrix as sensitivity to pseudorange
doppler gives info on velocity but also position
kindanot worth the effort rn

but, if transmitters were in LEO, suddenly geometry is different, line of sight vector is now far more sensitive

"transit on steroid paper"..positioning with doppler with LEO transmitters...
- ask axelrad for this
