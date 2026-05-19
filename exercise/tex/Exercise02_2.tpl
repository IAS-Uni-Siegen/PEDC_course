# Subtask 2.1.1 Import necessary modules (numpy as np and matplotlib.pyplot as plt) and add constant variables for the constant values.

import numpy as np
import matplotlib.pyplot as plt

# Create color list and marker list
color_list = ['red', 'blue', 'green', 'orange', 'black', 'cyan', 'magenta', 'purple']
marker_list=['.', '*', '+', '_', 'o', 's', 'D', '^', 'v', '<', '>', 'p', 'h', 'H', 'x', 'D', 'd', 'P', 'X']

# Subtask 2.2.1 Add constant variables for the constant values.

# ---------------------------------------------------------------------
# Fixed constants for the tutorial
# ---------------------------------------------------------------------
<Declare the constant values and use the variables Q_store, V_CC and I_C>
<Declare the constant np.array for variable I_Brev_parameter and dQ_store>

# Subtask 2.2.2 Create a function with input parameter  Delta Q_store, which calculates total charge Q_tot.

# Calculate total charge: Q_tot = Q_store + dQ_store
def get_Q_tot(act_dQ_store):
    return <Add calculation>

# Subtask 2.2.3 Create a function with input parameters Q_tot and I_B,ref, which calculates  storage time  t_s.

# Calculate total charge: t_s= Q_tot/I_C
def get_t_s(act_Q_tot, act_I_C):
    return <Add calculation>

# Subtask 2.2.4 Create a function with input parameter  t_s, which calculates  switch loss energy  E_off (approximation).

# Calculate the approximated switch loss energy E_off = V_CC*I_CC*t_s
def get_E_off(act_V_CC, act_I_C, act_t_s):
    return <Add calculation>

if __name__ == "__main__":
    # Subtask 2.2.5 Plot t_s versus dQ_store for the three reverse-base currents.

    # Calculate the total charge
    Q_tot=<Add calculation>

    # Generate the plot
    plt.figure(figsize=(10, 6))
    <Copy paste for loop from previous example and update variable names (Hint: in enumerate(I_Brev_parameter)>
    # Put legend to upper left
    plt.legend(loc='upper left')
    <Copy paste the section above and update the legend and plot the diagram>
    <Both access are scaled linearly.>

    # Subtask 2.2.6 Plot the turn-off energy proxy E_off versus dQ_store for the three reverse-base currents.

    # Calculate the total charge
    Q_tot=<Add calculation>
 
    # Generate the plot
    plt.figure(figsize=(10, 6))
    <Copy paste the section above and update the legend and plot the diagram>


    # Subtask 2.2.7 Plot t_s versus I_Brev for dQ_store = 20e-6C.

    # Set the additional deep saturation charge
    <Declare the constant the variables dQ_store_exp>

    # Calculate the total charge
    <Calculate Q_tot>

    # Generate the plot
    plt.figure(figsize=(10, 6))

    # Calculate the storage time dependend on reverse-base current
    t_store = <Add calculation>        
    # Create legend
    text= r"Parameter: $\Delta Q_\mathrm{s}$" +  f"={dQ_store_exp}C"
    <User 'plt.bar' to plot the 3 values. Use color 'green' (Hint: For loop is not needed)>
    # Put legend to upper left
    plt.legend(loc='upper left')
    <Copy paste the section above and update the legend and plot the diagram>


