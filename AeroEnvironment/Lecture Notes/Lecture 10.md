# Understand Basic Physics of Earth's ionosphere

## Origin of ionosphere
![[Pasted image 20260922083328.png]]


## Absorption in Earth's Atmosphere
$$
\begin{gathered}
I = \text{solar flux} = \mathrm{\frac{J}{\frac{cm^2}{\sec}}} = \mathrm{\frac{W}{cm^2}} \\
dI \approx IdH \\
dI = -\sigma n I dH
\sigma = \text{absorption cross section}\, \mathrm{cm^2}
\sigma \text{ is moleucle, atom, dependent } \lambda \text{ dependent} \\
n = \text{number density}\,\mathrm{cm^{-3}} \\
\frac{dI}{I} = -\sigma ndH \to \ln(I) |_{\infty}^h \sigma(h)n(h)dh \\
I(h) = I_{\infty}e^{-\tau} \\
\tau = \text{optical length}\\
\end{gathered}

$$

# Atmospheric Heating
![[Pasted image 20260922084437.png]]
**Excitation**
$$
\begin{gathered}
N_{2} + \gamma \to N_{2}^{*}
\end{gathered}
$$
**Dissociation**

$$
N_{2} + \gamma \to N+N
$$
**Ionization**

$$
N_{2} + \gamma \to N_{2}^{*} + e^{-}
$$
![[Pasted image 20260922084857.png]]
we are not concered by visible and infrared bc they are not energetic enough. only the relevant solar flux is a concern


![[Pasted image 20260922085338.png]]

![[Pasted image 20260922085737.png]]

![[Pasted image 20260922090308.png]]

$$
\begin{gathered}
dI = -\sigma n(h)Idh \\
dI = \sigma n(h)Idz \text{sec}(\chi) \\
z,\chi = \text{zenith, solar zenith angle} \\
I(z) = I_{\infty}e^{-\int_{\infty}^z n(z)\sigma \text{sec}\chi dz} \\
\text{if } n(z)=n_{0}e^{-z/H} \\
I(z) = I_{\infty}e^{-Hn(z)sigma\text{sec}\chi} \\
I(z,\lambda,\chi) = I_{\infty}e^{-\tau(z,\lambda,\chi)}
\end{gathered}
$$

## Chapman Layer
$$
\begin{gathered}
\text{Ionization production rate: P }- \mathrm{\frac{pair}{\frac{m^3}{s}}} \\
P = I(z,\lambda,\chi)n(z) \sigma \eta_{i} \\
\eta_{i} = \text{ionization efficiency (0-1)} \\
\sigma_{i} = \text{cm2 ionization cross section} \\
P = I_{\infty}e^{-Hn(zsigma \sec \chi}* n\eta_{i} n(z) \\
P = I_{\infty}\sigma\eta_{i}n_{0}e^{-z/H}\exp(-H\sigma \sec \chi n_{0} e^{-z/H}) \\
\text{set } \frac{dP}{dz} = 0 \text{ to find zmax}\\
z_{max} = H\ln(n_{0}\sigma H \sec \chi)\\
P_{max} = n_{i} \frac{I_{\infty}}{H}\cos(\chi)e^{-1} \\
\end{gathered}
$$
![[Pasted image 20260922091436.png]]

$$
\begin{gathered}
z_{max} = H\ln(n_{0}\sigma H \sec \chi)\\
P_{max} = n_{i} \frac{I_{\infty}}{H}\cos(\chi)e^{-1} \\
\end{gathered}
$$
![[Pasted image 20260922091519.png]]

$$
\begin{gathered}
\frac{dn_{e}}{dt} = P-L \\
L = \text{loss} \\
P: O+\gamma \to O^+ + e^- \\
L: O^+ + e^- \to O + \gamma \\

\text{at equalibrium: } \frac{dn_{e}}{dt}=0 \to P=L \\
L = \alpha n_{O^+}n_{e}\approx\alpha n_{e}^2\\
\alpha = \text{recombonation coefficient} \\
P=L \to P=\alpha n_{e}^2 \to n_{e}=\sqrt{ \frac{P}{\alpha} }
\end{gathered}
$$

![[Pasted image 20260922092024.png]]

![[Pasted image 20260922092150.png]]
![[Pasted image 20260922092509.png]]

![[Pasted image 20260922092524.png]]
D region

ngl there's a lot of chem stuff from here on out (D,E,F regions, look at it later)

![[Pasted image 20260922093659.png]]
![[Pasted image 20260922093706.png]]
![[Pasted image 20260922093711.png]]
![[Pasted image 20260922093717.png]]
![[Pasted image 20260922094350.png]]