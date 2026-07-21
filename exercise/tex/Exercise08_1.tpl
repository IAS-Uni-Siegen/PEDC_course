# Subtask 8.6.1 Import `numpy` as `np` and `matplotlib.pyplot` as `plt`.

<import numpy and matplotlib.pyplot>

# Subtask 8.6.2 Assign variables for all capacitance, ESR, ESL, frequency-range, and target-impedance values.

# Frequency range and target impedance
<Add nd.array as variable frequency logarithmically scaled for 40000 values>
<Add constant variable target_impedance>

# Branch parameters: C [F], ESR [ohm], ESL [H]
electrolytic = {"C": 1000e-6, <Add remaining dictionary value>}
<Add dictionaries for film, mlcc_local and mlcc_remote with keys=C,ESR and ESL>

# Subtask 8.6.3 Create a function `capacitor_impedance(f, C, ESR, ESL)` that returns the complex branch impedance.

def capacitor_impedance(f, C, ESR, ESL):
    """Return complex impedance of a series ESR-ESL-C model."""
    f = np.asarray(f, dtype=float)
    <Check all input parameters according negative values>
        raise ValueError("Use positive frequency/capacitance and non-negative ESR/ESL.")
    <Calculate omega>
    <Calculate and return the result -> ESR + 1j * (omega * ESL - 1 / (omega * C))>

# Subtask 8.6.4 Create a function `parallel_impedance(*branches)` that returns the complex impedance of parallel branches.

def parallel_impedance(*branches):
    """Return equivalent complex impedance of parallel branch arrays."""
    <Check all input parameters according content>
        raise ValueError("At least one branch is required.")
    <Create complex np-Array as variable  admittance with same size as branch>
    <Calculate admittance as sum of reciprocal branch values within a for-loop>
    return 1 / admittance

# Subtask 8.6.5 Create a function self_resonant_frequency(C, ESL)

<Add function self_resonant_frequency(C, ESL)>

# Subtask 8.6.6 Create a function local_extrema(y), that returns the minimum and maxiumum indices of an np-array
def local_extrema(y):
    """Return indices of strict local minima and maxima."""
    y = np.asarray(y)
    # [Start index: End index] with '-' are count from the end. Index start is 0.
    # [1:-1] = all elements except first and last, [:-2] all elements except the last 2
    minima = np.where((y[1:-1] < y[:-2]) & (y[1:-1] < y[2:]))[0] + 1
    <Calculate the maxima>
    return minima, maxima


# Subtask 8.6.7 Create a function intervals_below(f, y, threshold), that returns the interval below a threshold

def intervals_below(f, y, threshold):
    # Calculate boolean mask for the complete list
    <Calculate the variable mask as boolean array, which indicated, if the y-value is below threshold>
    # Identify border (False to True or vice versa)
    changes = np.diff(mask.astype(int))
    # Store border index for start and end
    starts = list(np.where(changes == 1)[0] + 1)
    ends = list(np.where(changes == -1)[0])
    # Check if first element is still below the theshold (not detected by diff)
    <Perform the check for the first element by using boolean mask-array>
        # Add it the first index as first entry to the start list
        starts.insert(0, 0)
    # Check if last element is still below the theshold (not detected by diff)
    <Perform the check for the last element by using boolean mask-array>
        # Add the last index as last entry to the end list
        ends.append(len(mask) - 1)
    # Return the lists
    return [(f[start], f[end]) for start, end in zip(starts, ends)]


#  Calculate capacitor impedance for all capacitor types
Z_electrolytic = capacitor_impedance(frequency, **electrolytic)
<Calculate capacitor impedance for Z_film, Z_mlcc_local and Z_mlcc_remote>

srf = {
    "Electrolytic": self_resonant_frequency(electrolytic["C"], electrolytic["ESL"]),
    "Film": self_resonant_frequency(film["C"], film["ESL"]),
    "MLCC local": self_resonant_frequency(mlcc_local["C"], mlcc_local["ESL"]),
    "MLCC remote": self_resonant_frequency(mlcc_remote["C"], mlcc_remote["ESL"]),
}

for name, value in srf.items():
    print(f"{name:14s} SRF = {value/1e3:10.3f} kHz")

# Subtask 8.6.8 Plot the impedance magnitude of the electrolytic, film, and locally mounted MLCC branches.

plt.figure(figsize=(9, 5.5))
plt.loglog(frequency, np.abs(Z_electrolytic), label="Electrolytic")
<Add plot for Z_film and Z_mlcc_local with label Film and Z_mlcc_local>
# Add vertical line at each minimum
for name in ("Electrolytic", "Film", "MLCC local"):
    plt.axvline(srf[name], linestyle="--", linewidth=0.9)
plt.xlabel("Frequency (Hz)")
plt.ylabel("Impedance magnitude (ohm)")
plt.title("Individual capacitor-branch impedance")
plt.grid(True, which="both")
plt.legend()
plt.tight_layout()
plt.show()


# Subtask 8.6.9 Explain why the branch with the largest capacitance is not the lowest-impedance branch at every frequency.
#-> Missing explanation

# Subtask 8.6.10 Calculate and plot the total bank impedance for the locally mounted MLCC.

<Calculate the impedance Z_bank_local when all capacitors are connected in parallel>
magnitude_local = np.abs(Z_bank_local)
<Calculate the local minimum (minima_local) and maximum (maxima_local)>
<Calculate the frequency ranges bands_local, where the impedance is below the target impedance>

plt.figure(figsize=(9, 5.5))
plt.loglog(frequency, magnitude_local, label="Parallel bank, local MLCC")
plt.axhline(target_impedance, linestyle="--", label="20 mOhm target")
for index in maxima_local:
    plt.scatter(frequency[index], magnitude_local[index], marker="o")
for index in minima_local:
    plt.scatter(frequency[index], magnitude_local[index], marker="x")
plt.xlabel("Frequency (Hz)")
plt.ylabel("Impedance magnitude (ohm)")
plt.title("Hybrid-bank impedance and anti-resonance")
plt.grid(True, which="both")
plt.legend()
plt.tight_layout()
plt.show()

# Subtask 8.6.11 Numerically detect local impedance minima and anti-resonance maxima.

print("Local-bank extrema:")
<For-loop over the local minimums>
    print(f"  minimum at {frequency[index]/1e6:.4f} MHz: {magnitude_local[index]*1e3:.3f} mOhm")
<For-loop over the local maximums>
    print(f"  anti-resonance at {frequency[index]/1e6:.4f} MHz: {magnitude_local[index]*1e3:.3f} mOhm")

# Subtask 8.6.12 Determine all frequency intervals where Z_bank<20Ohm.

print("\nFrequency bands below 20 mOhm:")
<For-loop over bands_local>
    print(f"  {start/1e6:.4f} MHz to {end/1e6:.4f} MHz")


# Subtask 8.6.13 Repeat the bank calculation using 10nH for the remote MLCC branch.


<Calculate the impedance Z_bank_remote when all capacitors are connected in parallel>
magnitude_local = np.abs(Z_bank_remote)
<Calculate the local minimum (minima_remote) and maximum (maxima_remote)>
<Calculate the frequency ranges bands_remote, where the impedance is below the target impedance>

evaluation_frequency = 5e6
evaluation_index = np.argmin(np.abs(frequency - evaluation_frequency))

print(f"At 5 MHz, local-bank impedance  = {magnitude_local[evaluation_index]*1e3:.3f} mOhm")
print(f"At 5 MHz, remote-bank impedance = {magnitude_remote[evaluation_index]*1e3:.3f} mOhm")
print("Remote-bank frequency bands below 20 mOhm:")
for start, end in bands_remote:
    print(f"  {start/1e6:.4f} MHz to {end/1e6:.4f} MHz")



# Subtask 8.6.14 Plot the local and remote bank impedances in one graph.

plt.figure(figsize=(9, 5.5))
plt.loglog(frequency, magnitude_local, label="Local MLCC: 1 nH")
plt.loglog(frequency, magnitude_remote, label="Remote MLCC: 10 nH")
plt.axhline(target_impedance, linestyle="--", label="20 mOhm target")
plt.xlabel("Frequency (Hz)")
plt.ylabel("Impedance magnitude (ohm)")
plt.title("Effect of MLCC placement on bank impedance")
plt.grid(True, which="both")
plt.legend()
plt.tight_layout()
plt.show()

