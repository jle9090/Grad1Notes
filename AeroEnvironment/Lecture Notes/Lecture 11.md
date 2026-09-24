Ionosphere variations 

variety of processes move plasma in ionosphere
- winds - neutrla winds drag ions, if collision frequency is high enough
- drifts - various forces causes plasma to drift
	- E and M fields, grav presure, etc
- complex spatial and temporal variations in ionosphere

$$
TEC = \int_{0}^\infty n_{e}(z)dz
$$

south atlantic anamoly
- here, earth's mag field is weaker
- ![[Pasted image 20260924083410.png]]

![[Pasted image 20260924083442.png]]


$$
\begin{gathered}
f_{pe}(mHg) = \frac{\omega_{pe}}{2\pi}=a\sqrt{n_{e}(cm^{-3})} \\
\omega_{pe}=\sqrt{\frac{n_{e}q^2}{m_{e}\epsilon_{0}}}\approx \sqrt{n_{e}}
\end{gathered}
$$
"ionosonder"
- shooting up
- tune wave frequency
- tune high enough going away small fraction coming back (what)
- can determine density...
- as freq increases, do not see them coming back anymore
	- because penetratres F layer
	- frequency is proportional to density

solar cycle variation
- densities are much higher at solar max vs solar min
- higher EUV/X-rays fluxes lead to higher ionization rates

f107
- 10.7 cm that goes thoruhg ionosphere, atmosphere, reaches the ground
- correlates with sun spot number
- f10.7 itself does not ionize
- UV and Xray correleates with sunspot variation as well

![[Pasted image 20260924084032.png]]
![[Pasted image 20260924084038.png]]

**Magnetic Field**
see actual notes for diagrm drawn

**Equatorial Electrojet EEJ**
- plasma physics with Bfield lead to an intesne current that flows East in dayside ionosphere
- restriced to narrow regionin latitude (110-130 km) (E region)
![[Pasted image 20260924084547.png]]
$\vec{J}=\sigma\vec{E}$ (east direction)

magnetic equator is different from earth equator, 

**Equatorial ionizaiton anamoly**
- due to EEJ, and E field arises
- E x B leads to a drift in vertical direction
- plasma rises, then above altitude, falls back down along field lines
- "fountain effect"
![[Pasted image 20260924084756.png]]

$$
\begin{gathered}
\vec{v_{d}} = \frac{\vec{F} \times \vec{B}}{qB^2} \\
\vec{F}=q\vec{E} \\
\vec{v_{d}} = \frac{\vec{E}\times \vec{B}}{B^2}
\end{gathered}
$$

![[Pasted image 20260924085144.png]]

**Equatorial Spread F**
- plasma instabilties that occur right after sunset cause F region to take on array of structures
	- time scales from seconds to hours
	- spatial scales from cm to tens of km

![[Pasted image 20260924085349.png]]

**Equatorial plasma bubbles**
- instability due to heavier fluid on top of lighter fluid
- leads to rising bubbles with detailed structure and wide range of spatial scales, and large density variation
![[Pasted image 20260924085552.png]]
![[Pasted image 20260924085556.png]]

**Mid latitudes sporadic E** leading to a higher e density
- sporadic increase in E region electron density
- happens at night by orders by magnitude
- "patch" of increased ionization
- stall not clear what spatial scale is
- observed by radio wave scattering
- Effect likely due TO shear winds driving metal ions into thin layer
- ![[Pasted image 20260924085705.png]]

**high latitude polar cap absorption**
- solar energecitc protons (SEPS) deposet energy in the d region of the ionosphere
	- flow along open mag field lines
- increased D region density adds to absoption of radio waves
	- polar cap absorption (PCA)
	- aircraft using HF
		- during PCA and polar flight lose comms
		- D region e density increase, and nuetron density is more dense than E and F region
		- plasma frequency is proporaitonal to density (electorn density)
		- HF radio supposed to reflect in atmosphere with reflection and decay
		- normally D region density is low...
		- in absoption even, D region is "enhanced", 
			- more decay and absorption
		- neutron density many times higher because of scale height
- ![[Pasted image 20260924090003.png]]
- at aurora oval, $e^-$ is higher

![[Pasted image 20260924090725.png]]


**IRI model**
![[Pasted image 20260924091117.png]]

**Plasmasphere**
boundary between topside ionosphere and plasma sphere: thermal pressure and magnetic pressure are equal
- plasma becomes confined by B field
somtimes defined by altitude where H+ (protons) become dominant ion

**Plasmasphere structure and variation**
![[Pasted image 20260924091224.png]]

**Kp index**
- K index quantifies disturbances in horizontal component of Earth's B field with an interger in range 0-9
	- 1=calm
	- 5=geomagnetic storm
	- 9 = very very rare
- measured at various ground magnetometer stations
- Kp is averge over all stations "planetary K index"
- quasi logarithmic, Kp =9 is about 10 times stronger than Kp=3

**Plasmasphere gets "squeezed"**
- Kp is high, plasmasphere gets compresed
- **plasmapause** is where density drops dramatically (used to be Carpenters Knee)
- ![[Pasted image 20260924091725.png]]

**Plasmasphere temperature**
![[Pasted image 20260924091742.png]]

$$
\begin{gathered}
v_{th} = \sqrt{\frac{k_{B} T}{m}} \\
v_{rms} = \sqrt{\frac{3 k_{B} T}{m}} \\
\\
\\
f(v) = 4pi (\frac{m}{2\pi T})^{3/2}v^2 e^{\frac{-mv^2}{2kT}} \\
k_{b}T = \text{unit of energy}
\end{gathered}
$$

![[Pasted image 20260924092028.png]]


![[Pasted image 20260924092250.png]]

**GCPM (global core plasma model) plasmasphere model**
- plasmasphere storngly affects spacecraft charging and raido wave propogation

![[Pasted image 20260924092602.png]]

**ionosphere effects**
- collects electorns and ions as they fly through inosphere
	- becomes negatively or positibly charged
	- this bad
- ionosphere affects radio wave propgoation (good and bad)
- othes
	- scintaillations
	- sputtering
	- solar array potentials

spacecraft charging
- charge from ionosphere/plasmasphere can accumulate on s/c surfaces
- ares with different charge can lead to arcing or other discharge -> damage

![[Pasted image 20260924092832.png]]

![[Pasted image 20260924092841.png]]

![[Pasted image 20260924092903.png]]


$$
\begin{gathered}
\frac{dQ}{dt} = I_{e}(V)+I_{i}(V)+I_{SEE_{i}}(V)+I_{b}(V)+I_{ph}(V)
\end{gathered}
$$
at equalibirum
$$
\begin{gathered}
\frac{dQ}{dt} = I_{e}(V)+I_{i}(V)+I_{SEE_{i}}(V)+I_{b}(V)+I_{ph}(V) \\
\text{in LEO at night side at 1000 K}\\
I_{ph}(V) = 0 \\
I_{b}(V)  = 0 \\
I_{SEE_{i}}(V) = 0 \\
\frac{dQ}{dt} =0\\
\therefore I_{e}+I_{i}=0 \\
V_{sc} \approx 7.8 \mathrm{\frac{km}{s}} \\
V_{eth}\approx 200\mathrm{\frac{km}{s}} \\
V_{ith}\approx 1.2 \mathrm{\frac{km}{s}} \\
I_{i} = q_{i}n_{i}A_{n}V_{sc}\\
I_{e} = -\frac{1}{4}q_{e}n_{e}A_{s}V_{eth}e^{\frac{qv}{kT}} \\
v_{e,th} = \sqrt{\frac{3kT}{m_{e}}}
\end{gathered}
$$
![[Pasted image 20260924093854.png]]

$$
\begin{gathered}
V = \frac{kT_{e}}{q_{e}}\ln{(\frac{4V_{sc}}{V_{eth}} frac{A_{n}}{A_{s}})} \\
A_{n} = \pi r^2\\
A_{s} = 4\pi r^2 \\
\end{gathered}
$$

size dependent? NO
shape dependent? YES