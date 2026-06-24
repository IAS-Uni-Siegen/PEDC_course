# ---------------------------------------------------------------------
# Fixed constants for the tutorial
# ---------------------------------------------------------------------
# Subtask 3.2.1 Create a dictionary with Dev[voltage class].
#               To each voltage class key the a internal dictionary with keys 'R_DSon' and 't_r_f' is to assign with the correspondedn value

# Create a loss map for three MOSFET families:
    
Devices = {
    'Dev150':  {'R_DSon': 4e-3, 't_r_f': 35e-9},
    'Dev300':  <Add dictionary>,
    'Dev650':  {Add dictionary},
}

# Subtask3.2.2 Add constant variables for the constant values and define the parameter range  with 100 samples for current and 280 samples for switching frequency.

<Add constant values V_DS and D>

# Create a linear space with 100 samples
I_D_range = <Add linear line space with 100 samples>
# Create a linear space with 100 samples
f_s_range = <Add linear line space with 100 samples>

# Subtask 3.2.3 Create a function with input parameters  I_D to calculate I_rms
def get_I_rms(act_I):
    <Add calculation>
    return I_rms

# Subtask 3.2.4 Create a function with input parameter  $I_ms and R_DSon, which calculates the power consumption for on-state.
def get_P_closs(act_I, act_RSon):
    <Add calculation>
    return P_closs

# Subtask 3.2.5 Create a function with input parameter I_D and f_s, which calculates  switch power loss based on equation
def get_P_sloss(act_I, act_t_r_f, act_f_s):
    <Add calculation>
    return P_sloss


if __name__ == "__main__":
    # Subtask 3.2.6 Plot total loss versus current at one fixed frequency within the given frequency range for all devices.

    # Define fixed frequency (middle)
    fixed_frequency = 100e3
    plot_colors = ['red', 'blue', 'green']

    # Generate the plot
    plt.figure(figsize=(10, 6))
    # For-loop over devices
    for i, act_device_name in enumerate(Devices):
        act_device=Devices[act_device_name]
        # Calculate rms-current
        I_rms = <Call function>
        # Calculate conduction power loss
        P_closs = <Call function>
        # Calculate switching power loss
        P_sloss = <Call function>
        # Calculate the total loss
        P_tot = <Add calculation>
        # Create legend per result
        text=act_device_name
        plt.plot(I_D_range, P_tot, label=text, color=plot_colors[i])
            

    plt.xlabel("drain source current in A")
    plt.ylabel("Power loss in W")
    plt.title(f"Total power loss versus drain source current at fs={fixed_frequency}Hz")
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.legend()
    plt.tight_layout()
    plt.show()
