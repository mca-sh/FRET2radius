# FRET2radius

FRET2radius simulates shot-noise-broadened distributions of absolute donor-acceptor distances and Förster resonance energy transfer (FRET) efficiencies as obtained in single molecule FRET experiments. 

To run FRET2radius:
1. add folder `FRET2radius` to MATLAB's path
2. run command `FRET2radius` in MATLAB's command window.

FRET2radius opens with the default configuration:
![image](https://github.com/mca-sh/FRET2radius/assets/7199132/64a3c483-0491-453e-ab73-13da1316f4b4)


## Calculations

First, conformation broadening is induced by generating 100000 Normal-distributed absolute donor-acceptor distances $r$, using the conformational equilirium distance $\mu$ (`radius` in FRET2radius) and the standard deviation of the distribution $\sigma$ (`radius dev.` in FRET2radius), such that $r \sim \mathcal{N}(\mu,\sigma^{2})$.

Absolute distances $r$ are then converted to absolute FRET efficiencies $E$ using the Förster radius $R_0$ (`R0` in FRET2radius), such that $E(r)=\frac{1}{1+ \left( \frac{r}{R_0} \right)^6}$.

Depending on `noise type`, shot-noise broadening is induced by Poisson- or Normal-distributing donor, $I_D$, and acceptor, $I_A$, fluorescence intensities such that:
- $\left( I_D+noise \right) \sim \mathcal{P}(I_0\left( 1-E\right)+noise)$ and $\left( I_A+noise \right) \sim \mathcal{N}(I_0 E + noise)$,
- or $I_D \sim \mathcal{N}(I_0 \left( 1-E \right),I_0 \left( 1-E \right) + noise )$ and $I_A \sim \mathcal{N}(I_0 E ,I_0 E + noise)$.

$I_0$ is fixed to 100 photon counts and $noise$ depends on the signal to noise ratio $SNR$ (`SNR` in FRET2radius) such that $noise = \frac{I_0}{SNR}$.

Finally, apparent FRET efficiencies $FRET$ (`FRET` in FRET2radius) are calculated from donor and acceptor shot-noise-broadened intensities with $FRET=\frac{I_A}{I_D+I_A}$ and apparent donor-acceptor distances $r_{app}$ (`app. radius` in FRET2radius) are calculated from apparent FRET efficiencies with $r_{app}=R_0\sqrt[^6]{\frac{1}{FRET}-1}$.

## Example of use

### Conformation broadening

In the first example, we want to visualize the effect of conformation-induced boradening only. 
For this, we set `SNR` to infinite and increase broadening with `radius dev.`.
When the equilibrium distance is varied to very large or very short, we see that the apparent FRET distribution loses its symmerical shape but not the apparent distance distribution.
[state-space-broadening.webm](https://github.com/mca-sh/FRET2radius/assets/7199132/59a9dd69-7eff-42dd-a1bd-d988b1f16817)

### Shot-noise broadening

In the second example, we want to visualize the effect of shot-noise-induced boradening only. 
For this, we set `radius dev.` to zero and increase the broadening by decreasing `SNR`.
When the equilibrium distance is varied to very large or very short, we see that the apparent distance distribution loses its symmerical shape but not the apparent FRET distribution.
[shot-noise-broadening.webm](https://github.com/mca-sh/FRET2radius/assets/7199132/186911c8-54a4-453f-83a4-594ab757604b)



