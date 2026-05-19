# Subtask 2.1.1 Import necessary modules (numpy as np and matplotlib.pyplot as plt) and add constant variables for the constant values.

import numpy as np
import matplotlib.pyplot as plt

# Create color list and marker list
color_list = ['red', 'blue', 'green', 'orange', 'black', 'cyan', 'magenta', 'purple']
marker_list=['.', '*', '+', '_', 'o', 's', 'D', '^', 'v', '<', '>', 'p', 'h', 'H', 'x', 'D', 'd', 'P', 'X']


# ---------------------------------------------------------------------
# Fixed constants for the tutorial
# ---------------------------------------------------------------------
eps_s = <Add constant value>          # 1.04e-12F/cm = 104e-12F/m
q = <Add constant value>              # C
mu_n = <Add constant value>           # 1000 cm^2/Vs = 0.1m^2/Vs

t_d_parameter = np.array([<Add parameter values>])     # explicit task values
ND_plot = np.logspace(<Add parameter range in log values and number of entries>)  # 1e14/cm^3 ...5e15/cm^3 = 1e20/m^3 ...5e21/m^3  (Hint 20, 21.7, 300)


# Subtask 2.1.2: Calculate the bunch through from doping density and and drift length.
def get_v_punch(act_n_D, act_t_d):
    <Add calculation>
    return v_punch

# Subtask 2.1.3: Calculate the drift-region specific resistance proxy.
def get_R_drift(act_n_D, act_t_d):
    <Add calculation>
    return R_drift

if __name__ == "__main__":
    # Subtask 2.1.4 Plot $V_\mathrm{PT}$ versus $N_\mathrm{D}$ for 4 $t_\mathrm{d}$-values within the given range.
    
    # Generate the plot
    plt.figure(figsize=(10, 6))
    for i, act_t_d in enumerate(t_d_parameter):
        # Calculate result
        v_punch_t_d = <Add calculation>
        # Create legend per result
        text=f"td={act_t_d}"
        plt.semilogy(ND_plot/1e6, v_punch_t_d, label=text, color=color_list[i])
    # Put legend to upper left
    plt.legend(loc='upper left')
    plt.xlabel(r'Carrier concentration (cm$^{-3}$)')
    plt.ylabel(r'Punch through voltage $V_{\mathrm{punch}}$ (V)')
    plt.title("Punch through voltage versus carrier concentration")
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.legend()
    plt.tight_layout()
    plt.show() 


    # Subtask 2.1.5 Plot R_drift versus N_D for the selected t_d

    # Generate the plot
    plt.figure(figsize=(10, 6))
    <Copy paste for loop from above and update variable names>
    # Put legend to upper left
    plt.legend(loc='upper left')
    <Copy paste the section above and update the legend and plot the diagram>
    <Keep a y-axis, which is logarithmically scaled.>



    # Generate the plot
    plt.figure(figsize=(10, 6))
    <Copy paste the plot block from above and update the necessary lines>
    <For this plot use 'plt.scatter(.... ,marker=marker_list[i])'>


