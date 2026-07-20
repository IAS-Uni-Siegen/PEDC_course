# Subtask 6.1.1 Import necessary modules and define constant values.

import numpy as np
import matplotlib.pyplot as plt

# Plot styles
color_list = ['red', 'blue', 'green', 'orange', 'black', 'cyan', 'magenta', 'purple']
marker_list = ['o', '.', '+', '_', '*', 's', 'D', '^', 'v', '<', '>', 'p', 'h', 'H', 'x', 'd', 'P', 'X']

# Material data
Ec_Si = 0.3     # MV/cm
<Add variable vsat_Si, I_cond, f_sw and Td>
<Add variable vsat_Si in units of 1e7 cm/s>
<Add variable Ec_GaN in unit MV/cm>
<Add variable vsat_GaN = 2.5 in units of 1e7 cm/s

# Device-size scaling
Wg = np.linspace(0.5, 6.0, 300)

# Converter conditions
<Add variable I in A, D (Dutycycle), Vdrv in volt>
fs_list = np.array([0.5e6, 1e6, 2e6, 5e6])  # Hz

# Subtask 6.1.2 Plot the normalized Johnson material metric E_c * v_sat for Si and GaN.

materials = ['Si', 'GaN']
BVfT_metric = [Ec_Si * vsat_Si, Ec_GaN * vsat_GaN]

plt.figure(figsize=(7, 5))
plt.bar(materials, BVfT_metric)
plt.ylabel(r'Normalized Johnson metric $E_c v_{\mathrm{sat}}$')
plt.title('Part A: Material-level Johnson metric comparison')
plt.grid(True, axis='y', linestyle='--', linewidth=0.5)
plt.tight_layout()
plt.show()

print(f"Normalized Johnson metric for Si  = {BVfT_metric[0]:.2f}")
print(f"Normalized Johnson metric for GaN = {BVfT_metric[1]:.2f}")
print(f"Ratio GaN / Si = {BVfT_metric[1] / BVfT_metric[0]:.2f}")

# Subtask 6.1.3 Create functions for R_on(Wg), Q_g(Wg), and the losses.

<Add function calc_Ron to calculate Ron with Wg_val according simplified model 0.18/Wg>

<Add function calc_Qg with parameter Wg_val to calculate Qg in Coulomb>

<Add function calc_Pcond with parameter Wg_val to calculate conduction power loss>

<Add function calc_Pgate with parameter Wg_val and fs_val to calculate gate switching power loss>

<Add function calc_Ptot with parameter Wg_val and fs_val to calculate total power loss>

# Subtask 6.1.4 Plot P_cond, P_g, and P_tot versus Wg for the four frequencies.

fig, axes = plt.subplots(2, 2, figsize=(12, 9), sharex=True, sharey=False)
axes = axes.ravel()

opt_results = []

for idx, fs in enumerate(fs_list):
    ax = axes[idx]
    Pcond = <Calculate conduction power loss>
    Pgate = <Calculate gate switching power loss>
    Ptot = <Calculate total power loss>

    ax.plot(Wg, Pcond, label=r'$P_{\mathrm{cond}}$')
    ax.plot(Wg, Pgate, label=r'$P_g$')
    ax.plot(Wg, Ptot, label=r'$P_{\mathrm{tot}}$')

    min_idx = np.argmin(Ptot)
    opt_Wg = Wg[min_idx]
    opt_P = Ptot[min_idx]
    opt_results.append((fs, opt_Wg, opt_P))

    ax.plot(opt_Wg, opt_P, 'ko', label='Optimum')
    ax.set_title(rf'$f_s = {fs/1e6:.1f}\,\mathrm{{MHz}}$')
    ax.set_xlabel(r'Normalized gate width $W_g$')
    ax.set_ylabel('Loss (W)')
    ax.grid(True, linestyle='--', linewidth=0.5)
    ax.legend()

plt.suptitle('Part B: Loss trade-off versus device size')
plt.tight_layout()
plt.show()


# Subtask 6.1.5 Print the approximate optimum Wg for each switching frequency.

for fs, opt_Wg, opt_P in opt_results:
    print(f"f_s = {fs/1e6:.1f} MHz -> optimum W_g ≈ {opt_Wg:.2f}, minimum total loss ≈ {opt_P:.3f} W")


