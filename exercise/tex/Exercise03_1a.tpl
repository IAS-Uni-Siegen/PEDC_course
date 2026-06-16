# Subtask 3.1.1 Import necessary modules (numpy as np and matplotlib.pyplot as plt) and add constant variables for the constant values.

import numpy as np
import matplotlib.pyplot as plt

# Create color list and marker list
color_list = ['red', 'blue', 'green', 'orange', 'black', 'cyan', 'magenta', 'purple']
marker_list=['o', '.', '+', '_', '*', 's', 'D', '^', 'v', '<', '>', 'p', 'h', 'H', 'x', 'D', 'd', 'P', 'X']


# ----------------------------------------------------------------------------
# Fixed constants for the tutorial (V_DC, I_D, V_drv, V_GP, Q_GS1, Q_GD, R_g)
# ----------------------------------------------------------------------------
<Add constant value> 

# Subtask 3.1.2 Create a function with input parameter R_g, which calculates the gate current I_g according
def get_I_g(act_R_g):
    <Add calculation>
    return I_g

# Subtask 3.1.3 Create a function with input parameter I_g, which calculates the t_M according
def get_t_M(act_Q_GD, act_I_g):
    <Add calculation>
    return t_M

# Subtask 3.1.4 Create a function with input parameter t_M, which calculates the energy loss E_sw
def get_E_sw(act_t_M):
    <Add calculation>
    return E_sw

if __name__ == "__main__":
    # Subtask 3.1.5 Plot t_M versus R_g for each value of Q_GD within the given range.

    # Generate the plot
    plt.figure(figsize=(10, 6))
    for i, act_Q_GD in enumerate(Q_GD):
        # Calculate gate current
        <Add calculation>
        # Calculate Miller time
        <Add calculation>
        # Create legend per result
        text=f"Q_GD={act_Q_GD}"
        plt.scatter(R_g, t_M, label=text, color=color_list[i], marker=marker_list[i])

    plt.xlabel(r'Resistance in Ohm')
    plt.ylabel('time in seconds')
    plt.title('Miller plateau time versus gate resistance')
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.legend()
    plt.tight_layout()
    plt.show()
