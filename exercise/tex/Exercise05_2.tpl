# ---------------------------------------------------------------------
# Fixed constants and map for the tutorial
# ---------------------------------------------------------------------

# Subtask 5.2.1 Create a map of devices and add constant variables for the constant values.

# Device map: Units-> Rdon [Ohm],  Qc [C], Coss [F]
devices = {
    'A':  {'Rdson': 45e-3, 'Qg': 110e-9, 'Coss': 120e-12},
    'B': {'Rdson': 60e-3, 'Qg': 70e-9, 'Coss': 80e-12},
    'C': {'Rdson': 35e-3, 'Qg': 180e-9, 'Coss': 180e-12}
}

# Constants 
<Initialize variables I_rms, V_drv, f_s>

# Subtask 5.2.3 Create a functions 'calculate_P_cond' to calculate conduction power loss
# and 'calculate_P_sw' tp calculate the switching power loss (from gate charge).
<Add functions 'calculate_P_cond(act_rdson)' and 'calculate_P_gd(act_Qg_C)'

# Subtask 5.2.4 Create a functions 'get_FOM_1_nC' to calculate the value according equation for $FOM_1$ 
# and 'get_FORM2_pF' to calculate the value according equation for $FOM_2$.
<Add functions 'get_FOM_1_nC(act_rdson, act_Qg_g)' and 'get_FOM_2_pF(act_rdson, act_Coss)'

if __name__ == "__main__":
    
    # Calculate P_cond, P_sw, FOM_1 and FOM_2 for each device
    # Loop over devices
    for device in devices:
        # Get rdson
        Rdson = devices[device]['Rdson']
        # Calculate conduction power loss
        <...>
        # Add it to the dictionary
        devices[device]["P_cond"] = P_cond
        # Calculate FOM_1_nC
        <...>
        # Add it to the dictionary
        <...>
        # Calculate FOM_2_pf
        <...>
        # Add it to the dictionary
        <...>
        # Calculate switching power loss
        <...>
        # Add it to the dictionary
        <...>

    # Subtask 5.2.2 Print the map as table.
    layout_cell = 12
    layout_name = 8

    # Loop over devices
    header = f"{'':<{layout_name}} | {'Rdson in Ohm':<{layout_cell}} | {'P_cond in W':<{layout_cell}} | {'P_gd in W':<{layout_cell}}"
    header = header  + f" | {'FOM_1':<{layout_cell}} | {'FOM_2':<{layout_cell}}  "
    header = header  + "\n-------------------------------------------------------------------------------------------------------"

    print(header)
    # Loop over devices
    for device in devices:
        # Assemble the line content per device
        plotline = f"Device {device:<{layout_name-7}} | {devices[device]['Rdson']:<{layout_cell}} | {devices[device]['P_cond']:<{layout_cell}.0f}"
        plotline = plotline + f" | {devices[device]['P_gd']:<{layout_cell}.3f} | {devices[device]['FOM_1']:<{layout_cell}.0f}"
        plotline = plotline + f" | {devices[device]['FOM_2']:<{layout_cell}.0f}"
        print(plotline)


    # Subtask 5.2.5 Plot the conduction loss and gate driver loss as bar plot for each device

    x_positions = range(len(devices)) # Position per device
    bar_width = 0.35  # Width of the bars

    plt.figure(figsize=(8, 5))
    # Loop over devices
    for i, device in enumerate(devices):
        # Plot bar for P_cond and P_gd for one device at the same x-coordinate
        plt.bar(i - bar_width/2, devices[device]['P_cond'], width=bar_width, label="P_cond in W" if i == 0 else "", color=color_list[2])
        plt.bar(i + bar_width/2, devices[device]['P_gd'], width=bar_width, label="P_gd in W" if i == 0 else "", color=color_list[3])

    # Add legend and title
    plt.xlabel("Device")
    plt.ylabel("Value")
    plt.title("Conduction loss and gate-drive loss")
    # Add device name at bar position
    plt.xticks(x_positions, devices)
    plt.legend()
    plt.tight_layout()
    plt.show()

    plt.figure(figsize=(8, 5))
    # Loop over devices
    for i, device in enumerate(devices):
        # Plot bar for FOM1 and FOM2 for one device at the same x-coordinate
        <...>
   
    # Add legend and title
    plt.xlabel("Device")
    plt.ylabel("Value")
    plt.title("Comparison of two practical FOMs")
    # Add device name at bar position
    plt.xticks(x_positions, devices)
    plt.legend()
    plt.tight_layout()
    plt.show()
