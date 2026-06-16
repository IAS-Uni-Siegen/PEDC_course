# Subtask 4.1.1 Import necessary modules (numpy as np and matplotlib.pyplot as plt) and add constant variables for the constant values.

import numpy as np
import matplotlib.pyplot as plt

# Create color list and marker list
color_list = ['red', 'blue', 'green', 'orange', 'black', 'cyan', 'magenta', 'purple']
marker_list=['o', '.', '+', '_', '*', 's', 'D', '^', 'v', '<', '>', 'p', 'h', 'H', 'x', 'D', 'd', 'P', 'X']


# ---------------------------------------------------------------------
# Fixed constants for the tutorial V_DC, I_tail_0, tau_PT, tau_NPT
# ---------------------------------------------------------------------

<Add constant value> 
tau_list = [tau_PT, tau_NPT]

# 2 Sections: Fast fall down and exponential function tail (I_ch  and t_fall):
<Add constant value> 

# t-range is about 5 tau = 5us
t_range  = <Add linear line space with 400 samples>

# Subtask 4.1.2 Create a function 'calculate_switch_off_current' with input parameter $t$ (time point array), which calculates the switch off current according the two tail segments.
def get_current_wave_form(act_t_range, tau):
    # Separate fall and tail range from input time vector
    t_fall_range = act_t_range[act_t_range<=t_fall]
    t_tail_range = act_t_range[act_t_range>t_fall]
    # Start of exponential function: Shift by minimal value
    t_tail_range = <Add calculation>
    # Calculate foll slope
    m_fall = <Add calculation>
    I_fall = <Add calculation>
    I_tail = <Add calculation>
    I_t = np.concatenate((I_fall, I_tail), axis=0)
    return I_t

# Subtask  4.1.4 Create a function with input parameter $i_\mathrm{tail}(t)$, which compute compute the tail-energy contribution according
def calculate_energy(act_I, act_t):
    # Integal (according trapetz rule)
    E = np.trapezoid(V_DC * act_I, act_t)
    return E

if __name__ == "__main__":
    # Subtask 4.1.3 Plot i_tail(t) in range t=0...5us for the PT and NPT case.

    E_list = []

    # Generate the plot
    plt.figure(figsize=(10, 6))
    for i, act_tau in enumerate(tau_list):
        # Calculate i_tail
        I_t = <Call function>
        # Calculate Energy
        E = <Call function>
        # Create legend per result and display Energy
        text=f"tau={act_tau} with Energy = {E:.2e}J"
        # plt.plot(t_range, I_t, label=text, color=color_list[i], marker=marker_list[i])
        plt.plot(t_range, I_t, label=text, color=color_list[i])


    plt.xlabel("time in [s]")
    plt.ylabel("Current in [A]")
    plt.title("Switch off current at PT and NPT MOSFET")
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.legend()
    plt.tight_layout()
    plt.show()
