final exam is on 12-10 open at 8am, 24 hours open, 2.5 hours to complete

**drag effect on elliptical orbit**
- as drag brings you down, spacecraft speeds up, orbit position is ahead of where you predict
- returns to the same perigee
- after a long itme, orbit will be circular, altitude = original perigee
- ![[Pasted image 20260915083346.png]]
- ![[Pasted image 20260915083448.png]]

**uncertainty in re entry time and location**
- uncertainty in atmospheric density dominates uncertainty in re-entry for large defunct s/c
- ![[Pasted image 20260915083615.png]]
- ![[Pasted image 20260915083820.png]]

**Orbit Maintenence**

$$
\begin{gathered}
P_{i} = (m+dm)V_{sc} \\
P_{f} = m(V_{sc}+dV) + dm(V_{sc} + V_{ex}) \\
\Delta P=mdV-dmV_{ex} \\
\text{mdV is set to 0 to maintain speed...} \\
F=\frac{\Delta P}{\Delta t} = -V_{ex} \frac{dm}{dt} \\
\text{$-V_{ex} \frac{dm}{dt}$ is result from thrust} \\
\text{if $-V_{ex} \frac{dm}{dt}$ is equal to drag, this maintains orbit}
\end{gathered}
$$


$$
\begin{gathered}
F_{D} = -V_{ex} \frac{dm}{dt} = \frac{1}{2} \rho V^2 C_{D} A \approx 0.2 \, \mathrm{\mu N} \\
dm = -\frac{F_{D}}{V_{ex}}dt \\
dm = \frac{0.2 \, \mathrm{\mu N}}{5 \, \mathrm{\frac{km}{s}}} * (3600*24*365) \\
dm = 1.26 \, \mathrm{kg} \text{ for 1 year with $V_{ex}=5 \, \mathrm{km/s}$}
\end{gathered}
$$

![[Pasted image 20260915090128.png]]

**Sputtering**
- impact from neutral atoms/molecules has potential to knock material from s/c surfrace

$$
\begin{gathered}
\text{Where $E_{th}$ is energy threshold, equations here are emperically determined} \\
\text{$m_{t}$ is mass of target atom} \\
\text{$m_{i}$ is mass of incident atom} \\
\text{$U$ is binding energy} \\
\text{$Q_i$ is normalization} \\
\\
E_{th} = 8U(\frac{m_{t}}{m_{i}})^{-1/3} \\
E_{th} = U\gamma(1-\gamma) \\
\gamma = \frac{4m_{t} m_{i}}{(m_{t}+m_{i})^2} \\
Y_{i}(E) = Q_{i}(\frac{E}{E_{th,i}})^{1/4}(1-\frac{E_{th,i}}{E})^{3.5}
\end{gathered}
$$

- usually $E_{th} > E_{impact}$, so sputtering yieldis low
- due to thermal distribution of velocities,there are always a few fast moving particles
- ![[Pasted image 20260915091024.png]]
- ![[Pasted image 20260915091640.png]]
![[Pasted image 20260915092058.png]]

$$
\begin{gathered}
dm = \rho RE \phi_{i} dAdt\\
\text{RE is reaction efficiency} \\
\text{$\phi$ is flux} \\
\frac{dx}{dt} = RE * \phi_{i} = RE*n_{i}V_{i}
\end{gathered}
$$
![[Pasted image 20260915092440.png]]

**Absorption of Solar Radiation**
- atmosphere absorbs chunk of the total solar irradiance (TSI), reduced from 1361 W/m^2 to ~1000 W/m^2 at surface
	- need to know for solar panels on ground
- ![[Pasted image 20260915092908.png]]
- ![[Pasted image 20260915093148.png]]
- ![[Pasted image 20260915093321.png]]
- ![[Pasted image 20260915093822.png]]![[Pasted image 20260915093832.png]]