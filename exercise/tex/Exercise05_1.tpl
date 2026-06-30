# Subtask 5.1.1 Import necessary modules (numpy as np and matplotlib.pyplot as plt) and create a map of the material.

import numpy as np
import matplotlib.pyplot as plt

# Create color list and marker list
color_list = ['red', 'blue', 'green', 'orange', 'black', 'cyan', 'magenta', 'purple']
marker_list=['o', '.', '+', '_', '*', 's', 'D', '^', 'v', '<', '>', 'p', 'h', 'H', 'x', 'D', 'd', 'P', 'X']

# ---------------------------------------------------------------------
# Fixed constants and map for the tutorial
# ---------------------------------------------------------------------

# Unit: Eg [eV],  E_crit[V/cm]
materials = {
    'Si':  {'Eg': 1.1, 'E_crit': 0.3e6},
    <map entries for 4H-SiCn and GaNWe>
}

# Voltage V_b
<V_b-varialble> 

# Subtask 5.1.3 Create a function 'calculate_w_drift' with input parameter E_crit

<Add function calculate_w_drift to calculate w-drift>

# Subtask 5.1.4 Create a function 'calculate_r_proxy' with input parameter E_crit and w_drift
<Add function calculate_r_proxy to calculate r-proxy>

# Subtask 5.1.5 Create a function 'calculate_r_normlized_proxy' with input parameter r_proxy  and r_ref_proxy
<Add function calculate_r_normlized_proxy to calculate normalized r-proxy (Normalized to Si)>

if __name__ == "__main__":
  
    # Calculate w_drift, r_proxy and r_norm_proxy (Normalized to SI) for each material
    # Loop over dictionary
    for material in materials:
        # Get E_crit
        E_crit=materials[material]['E_crit']
        # Calculate w_drift
        <Calculate w_drift>
        # Add it to the dictionary
        materials[material]["w_drift"] = w_drift
        # Calculate r_proxy
        <Calculate r_proxy>
        # Add it to the dictionary
        <Add it to the dictionary as addionally entry>
        # Calculate r_norm_proxy
        <Calculate r_norm_proxy>
        # Add it to the dictionary
        <Add it to the dictionary as addionally entry>

    # print result (5.1.2)
    layout_cell = 16
    layout_name = 8

    # Loop over materials
    header = f"{'Material':<{layout_name}} | {'Eg in eV':<{layout_cell}} | {'E_crit in V':<{layout_cell}} | {'w_drift in m':<{layout_cell}}"
    header = header  + f" | {'r_proxy':<{layout_cell}} | {'r_norm_proxy':<{layout_cell}}  "
    header = header  + "\n-------------------------------------------------------------------------------------------------------"

    print(header)
    for i, material in enumerate(materials):
        # Plot bar for Eg and E_crit at the same x-coordinate
        plotline = f"{material:<{layout_name}} | {materials[material]['Eg']:<{layout_cell}} | {materials[material]['E_crit']:<{layout_cell}.0f}"
        plotline = plotline + f" | {materials[material]['w_drift']:<{layout_cell}.5f} | {materials[material]['r_proxy']:<{layout_cell}.5e}"
        plotline = plotline + f" | {materials[material]['r_norm_proxy']:<{layout_cell}.3f}"
        print(plotline)

    # Subtask 5.1.6 Plot the map as bar plot for each material ($E_g$  and $E_{\mathrm{crit}}$ per material) 
    x_positions = range(len(materials))  # Position per material
    bar_width = 0.35  # Width of the bars

    plt.figure(figsize=(8, 5))
    # Loop over materials
    for i, material in enumerate(materials):
        # Plot bar for Eg and E_crit at the same x-coordinate
        plt.bar(i - bar_width/2, materials[material]['Eg'], width=bar_width, label="E_g in eV" if i == 0 else "", color=color_list[2])
        plt.bar(i + bar_width/2, materials[material]['E_crit']/1e6, width=bar_width, label="E_crit in MV/cm " if i == 0 else "", color=color_list[3])

    # Add legend and title
    plt.xlabel("material")
    plt.ylabel("Value")
    plt.title("Band gap and critical electric field")
    # Add material name at bar position
    plt.xticks(x_positions, materials)
    plt.legend()
    plt.tight_layout()
    plt.show()

    # Subtask 5.1.7 Plot the drift reqion thickness as bar plot for each material.
    plt.figure(figsize=(8, 5))
    # Loop over dictionary
    <Loop over dictionary>
        # Get w-drift in micrometer
        w_drift_um = <get value from dictionary> * 1000
        # Add bar
        plt.bar(material, w_drift_um)

    plt.ylabel(r'Drift-region thickness $W_{\mathrm{drift}}$ ($\mu$m)')
    plt.title(r'Task 5B: Estimated $W_{\mathrm{drift}}$ for $V_B = 1200$ V')
    plt.grid(True, axis='y', linestyle='--', linewidth=0.5)
    plt.tight_layout()
    plt.show()

    # Subtask 5.1.8 Plot the normalized proxy resistance normalized to material Si.
    plt.figure(figsize=(8, 5))
    # Plot
    # Loop over dictionary
    <Loop over dictionary>
        # Get normalized r-proxy
        r_norm_proxy = <get value from dictionary>
        # Add bar
        plt.bar(material, r_norm_proxy)

    plt.ylabel(r'Normalized $R_{\mathrm{drift,proxy}}$')
    plt.title(r'Task 5C: Normalized resistance proxy')
    plt.grid(True, axis='y', linestyle='--', linewidth=0.5)
    plt.tight_layout()
    plt.show()

