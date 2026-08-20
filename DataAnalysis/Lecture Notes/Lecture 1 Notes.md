# Class used for
* how to get data, where to get data, what software to use
* use either python or matlab
	* data files used in hw will be in matlab or text format
	* figure out bugs on your own
* Exams
	* there is in class section and take home section
* Research project
	* what
	* details to come
* limited ai allowed on research projects?
* pay attention to grammar of data analysis
* geodessy
	* measuring "shape of earth"
		* grav field
		* sea level
		* etc

# Types of Data
* we will talk about data gaps and how to handle them
	* fixing data before doing analysis
* example
	* seasonal fluctuatio in sea level changes, this can be eliminiated
	* how to elimnate periodic variation is a technique
* also learnn how to extrapolate data
	* curve fitting
		* to fit a curve is to model the data
* ![[Pasted image 20260820134517.png]]
	* take a shot
	* many times we only know precision, we don't really know accuracy

# Methods
* Univariate Statistics
	* PDFs
	* how to use PDFs to accept/reject hypothesis of data
	* chi squared, what does chi squared mean
	* std, std means
	* theoretical distributions
		* gaussian
* Bivariate Statistics
	* regression, curve fitting
	* regression - benchmark of ML for later
* Time Series Analysis
	* variability
* Data Filtering
	* digital filtering
	* ![[Pasted image 20260820135323.png]]
* Principal Component Analysis
	* what if we rotated the coordinates of the data to analyze?
	* ![[Pasted image 20260820135420.png]]
* Spatial Analysis
* Geostatisics
* Prolly not image analysis :(
	* usually need specialized software
	* qgis, arkinfo, ibl
* Map Projections
	* map projections already built into matlab python
	* need to understand how they distort

# Data Calibration Interpolation Editing
* ![[Pasted image 20260820135746.png]]
* how is data post processed basically
	* smoothing, accounting for periodic variation, curve fitting
* how should we interpolate data
	* ex; sat is down for 10 days, what about the part where it was dow
	* linear intepolation
* data editing
	* residiuals!!!!
	* estimating error of the data, where residuals is the difference between data to judge accuraacy
	* can also use residuals to indicate if data is valid
	* ![[Pasted image 20260820140042.png|417]]
		* compute std of residual, where 3x std is disregarded

## Useful tips for using analyzing data
![[Pasted image 20260820140138.png]]

basically weird things happen all the time with data