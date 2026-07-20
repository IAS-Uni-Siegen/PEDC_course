# Subtask 7.1.1 Import necessary modules and define the B_pk range.

import numpy as np
import matplotlib.pyplot as plt

# Plot styles
color_list = ['red', 'blue', 'green', 'orange', 'black', 'cyan', 'magenta', 'purple']
marker_list = ['o', '.', '+', '_', '*', 's', 'D', '^', 'v', '<', '>', 'p', 'h', 'H', 'x', 'd', 'P', 'X']

<Add B_pk for 400 values>

# Subtask 7.1.2 Create functions calc_Pcore(B), calc_Pcu(B) and calc_Ptotal(B) according the given equations.

<Add function calc_Pcore>

<Add function calc_Pcu>

<Add function calc_Ptotal>

# Subtask 7.1.3 Plot P_core, P_Cu, and P_total versus B_pk.

<Calculate P_core, P_cu and P_total>

plt.figure(figsize=(8, 5))
plt.plot(B_pk, P_core, label=r'$P_{\mathrm{core}}$')
plt.plot(B_pk, P_cu, label=r'$P_{\mathrm{Cu}}$')
plt.plot(B_pk, P_total, label=r'$P_{\mathrm{total}}$')
plt.xlabel(r'Peak flux density $B_{\mathrm{pk}}$ (T)')
plt.ylabel('Loss proxy (W)')
plt.title('Magnetic loss trade-off versus peak flux density')
plt.grid(True, linestyle='--', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()

# Subtask 7.1.4 Determine the approximate optimum B_pk that minimizes P_total.

idx_min = <Use argmin to get the index of the minimum value>
B_opt = B_pk[idx_min]
P_opt = P_total[idx_min]

print(f'Approximate optimum B_pk = {B_opt:.4f} T')
print(f'Minimum total loss proxy = {P_opt:.4f} W')



# Subtask 7.1.5 Mark on the plot the regions where the design is copper-loss dominated and core-loss dominated.

plt.figure(figsize=(8, 5))
plt.plot(B_pk, P_core, label=r'$P_{\mathrm{core}}$')
plt.plot(B_pk, P_cu, label=r'$P_{\mathrm{Cu}}$')
plt.plot(B_pk, P_total, label=r'$P_{\mathrm{total}}$')
plt.axvline(B_opt, color='black', linestyle=':')
plt.text(B_opt + 0.003, max(P_total)*0.7, 'Approx. optimum')
plt.text(0.07, max(P_total)*0.85, 'Copper-loss dominated')
plt.text(0.20, max(P_total)*0.35, 'Core-loss dominated')
plt.xlabel(r'Peak flux density $B_{\mathrm{pk}}$ (T)')
plt.ylabel('Loss proxy (W)')
plt.title('Dominant loss regions in magnetic design')
plt.grid(True, linestyle='--', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()

