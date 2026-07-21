# Remark: If you use this as single python file, you need to import numpy and matplotlib

# Subtask 8.7.1 Assign all constant values and create arrays for the harmonic currents and frequency-dependent ESR values.

# Base-life and thermal data
<Add constant variables base_life, reference_temperature, voltage_multiplier and thermal_resistance>

<Add nd.arrays as variables harmonic_frequencies, harmonic_currents, harmonic_esr(3 values frequency, RMS currents and ESR)>
<Add mission profile as nd.arrays: Add variables time_fraction. ambient_temperature, current_scale and segment_names>

# Subtask 8.7.2 Create function total_rms_current(currents) to calculate total RMS current
<Add function total_rms_current(currents)>

# Subtask 8.7.3 Create function spectral_loss(currents, esr) to calculate the spectral loss
def spectral_loss(currents, esr):
    currents = np.asarray(currents, dtype=float)
    esr = np.asarray(esr, dtype=float)
    <Check that the shape of currents and esr is not the same>
        raise ValueError("Current and ESR arrays must have identical shapes.")
    <Calculate and return the spectral loss>

# Subtask 8.7.4 Create function hotspot_temperature(ambient, loss, r_th=thermal_resistance) to calculate the hotspot temperature.
<Add function hotspot_temperature(ambient, loss, r_th=thermal_resistance) to calculate the hotspot temperature>

# Subtask 8.7.5 Create function expected_life(hotspot) to calculate the expected lifetime based on Voltage multiplier and reference temperature.
<Add function expected_life(hotspot) to calculate the hotspot temperature>

# Subtask 8.7.6 Calculate the full-load RMS ripple current and frequency-dependent loss.
<Calculate the full-load RMS ripple current>
<Calculate the frequency-dependent loss>

# Subtask 8.7.7 Compare the correct result with the incorrect approximation that uses the $100~\mathrm{Hz}$ ESR for every harmonic.
incorrect_loss=<Calculate the incorrect approximation>

print(f"Full-load RMS ripple current     = {full_load_rms:.3f} A")
print(f"Frequency-dependent loss        = {full_load_loss:.3f} W")
print(f"Loss using 100-Hz ESR everywhere = {incorrect_loss:.3f} W")
print(f"Approximation error             = {(incorrect_loss/full_load_loss - 1)*100:.1f} %")

# Subtask 8.7.8 For every mission-profile segment, scale all harmonic currents and calculate loss, hot-spot temperature, and segment life.
segment_loss = np.empty_like(time_fraction)
segment_hotspot = np.empty_like(time_fraction)
segment_life = np.empty_like(time_fraction)

for index, scale in enumerate(current_scale):
    scaled_currents = <Calculate the scaled currents>
    segment_loss[index] = <Calculate the segment losses>
    segment_hotspot[index] = <Calculate the segment_hotspot temperature>
    segment_life[index] = <Calculate the expected lifetime based on hotspot temperature>

print("Segment results:")
for name, loss, hotspot, life in zip(segment_names, segment_loss, segment_hotspot, segment_life):
    print(f"  {name}: loss={loss:.3f} W, hotspot={hotspot:.2f} degC, life={life:,.0f} h")


# Subtask 8.7.9 Plot hot-spot temperature and expected life versus mission-profile segment in separate figures.

plt.figure(figsize=(7.5, 4.8))
plt.bar(segment_names, segment_hotspot)
plt.xlabel("Mission-profile segment")
plt.ylabel("Hot-spot temperature (degree C)")
plt.title("Capacitor hot-spot temperature by mission segment")
plt.grid(True, axis="y")
plt.tight_layout()
plt.show()


plt.figure(figsize=(7.5, 4.8))
plt.bar(segment_names, segment_life)
plt.xlabel("Mission-profile segment")
plt.ylabel("Expected life (h)")
plt.title("Temperature-dependent life by mission segment")
plt.grid(True, axis="y")
plt.tight_layout()
plt.show()


# Subtask 8.7.10 Calculate the equivalent mission-profile lifetime using linear damage accumulation.

# The damage rate contributed by segment i is alpha_i / L_i.
segment_damage_rate = <Calculate each element a/L as part of and nd.array>
total_damage_rate = <Calculate the sum of the elements>
equivalent_life = <Calculate the equivalent life time>
 
print("Linear damage accumulation:")
<Add for-loop over zip(segment_names, time_fraction, segment_life, segment_damage_rate,)>
    print(
        f"  Segment {name}: alpha={fraction:.2f}, "
        f"life={life:,.0f} h, damage rate={damage:.6e} 1/h"
    )
 
print(f"  Total damage rate = {total_damage_rate:.6e} 1/h")
print(f"  Equivalent mission-profile life = {equivalent_life:,.0f} h")



# Subtask 8.7.11 Repeat the calculation using only the weighted-average ambient temperature and weighted-average current scale.

equivalent_life = 1 / np.sum(time_fraction / segment_life)

average_ambient = <Calculate the sum of time_fraction * ambient_temperature>
average_scale = <Calculate the sum of time_fraction * current_scale>
average_loss = <Calculate the spectral_loss>
average_hotspot = <Calculate the hotspot_temperature>
average_condition_life = <Calculate the expected life based on average_hotspot>
life_overestimate = (average_condition_life / equivalent_life - 1) * 100


# Subtask 8.7.12 Quantify the percentage error introduced by the average-condition shortcut and explain why it occurs.

print(f"Equivalent mission-profile life = {equivalent_life:,.0f} h")
print(f"Weighted-average ambient        = {average_ambient:.2f} degC")
print(f"Weighted-average current scale  = {average_scale:.3f}")
print(f"Average-condition life          = {average_condition_life:,.0f} h")
print(f"Lifetime overestimate           = {life_overestimate:.1f} %")


# Subtask 8.7.13 Repeat the full-load calculation at 70° ambient after all ESR values have doubled.

ambient_for_ageing = 70.0
original_loss = full_load_loss
original_hotspot = <Calculate the hotspot_temperature>
original_life = expected_life(original_hotspot)<Calculate the expected life based on original_hotspot>

aged_esr = 2 * harmonic_esr
aged_loss = <Calculate the spectral_loss>
aged_hotspot = <Calculate the hotspot_temperature>
aged_life = <Calculate the expected life based on aged_hotspot>

print("Full-load comparison at 70 degC ambient:")
print(f"  Original: loss={original_loss:.3f} W, hotspot={original_hotspot:.2f} degC, life={original_life:,.0f} h")
print(f"  Aged:     loss={aged_loss:.3f} W, hotspot={aged_hotspot:.2f} degC, life={aged_life:,.0f} h")
print(f"  Life reduction = {(1-aged_life/original_life)*100:.1f} %")