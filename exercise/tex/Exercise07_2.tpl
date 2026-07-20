# Subtask 7.2.1 Define the constant values.

rho = 1.72e-8
mu0 = 4*np.pi*1e-7

<Add frequency range 'f' as logspace with 500 values>

<Add constant variables for omega, r1, r2, t_foil and t_pcb>

# Subtask 7.2.2 Create a function calc_skin_depth(freq) for the skin depth delta(f).

<Add function calc_skin_depth>

# Subtask 7.2.3 Create a function onset_frequency(dim) calculation of frequency, which fulfills the condition dim/delta >= 1.0.
def onset_frequency(dim):
    # Get the first value, which fulfills the condition
    idx = <Index of first value, which fulfills the condition dim/delta >= 1.0>
    return f[idx]


<Calculate sin depth as 'delta' over the frequency range f>

# Subtask 7.2.4 Plot delta(f) from 1 kHz to 5 MHz.

plt.figure(figsize=(8,5))
plt.loglog(f, delta*1e6)
plt.xlabel('Frequency (Hz)')
plt.ylabel(r'Skin depth $\delta$ ($\mu$m)')
plt.title('Skin depth in copper versus frequency')
plt.grid(True, which='both', linestyle='--', linewidth=0.5)
plt.tight_layout()
plt.show()

# Subtask 7.2.5 Plot the ratios r/delta and t/delta for the conductor options.

<Calculate ratio_r1 as ration of r1 and skin depth>
<Calculate ratio_r2 as ration of r2 and skin depth>
<Calculate ratio_foil as ration of t_foil and skin depth>
<Calculate ratio_pcb as ration of t_pcb and skin depth>

plt.figure(figsize=(8,5))
plt.loglog(f, ratio_r1, label=r'$r=0.25\,\mathrm{mm}$')
plt.loglog(f, ratio_r2, label=r'$r=0.50\,\mathrm{mm}$')
plt.loglog(f, ratio_foil, label=r'$t=0.10\,\mathrm{mm}$ foil')
plt.loglog(f, ratio_pcb, label=r'$t=70\,\mu\mathrm{m}$ PCB copper')
plt.axhline(1.0, linestyle=':', color='black')
plt.xlabel('Frequency (Hz)')
plt.ylabel(r'Dimension / $\delta$')
plt.title('Onset of strong skin-effect limitation')
plt.grid(True, which='both', linestyle='--', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()

# Subtask 7.2.6 Indicate on the graph where each conductor begins to experience strong skin-effect limitation.
# Subtask 7.2.7 Print approximate onset frequencies and interpret.

for name, dim in [('round wire r=0.25 mm', r1), ('round wire r=0.50 mm', r2), ('foil t=0.10 mm', t_foil), ('PCB copper t=70 um', t_pcb)]:
    print(f'{name}: strong skin-effect onset around {onset_frequency(dim):.0f} Hz')

print('As frequency rises into the hundreds of kHz and MHz range, thinner foil, PCB copper, or litz-like conductors become increasingly attractive.')

