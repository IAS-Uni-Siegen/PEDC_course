# -------------------------------
# Assumed limits for tutorial use
# -------------------------------
<Add constant value: Vmax, Imax> 
 
# Define 1000 voltage samples from 0.01 to Vmax 
V = <Add linear line space with 1000 samples>
 
# ---------------------------------------
# Forward-bias SOA (FBSOA) - thermal lines
# ---------------------------------------
# Constant-power style approximations
<Add constant value: P_dc, P_1e4, P_1e5, t_1em4, t_1em5> 

# Subtask  4.2.2 Create a function 'get_FBSOA' with input parameter $t_\mathrm{max}
def get_FBSOA(act_t):
    # Separate by time ranges
    if act_t <= t_1em5:
     <Set the allowed power P_act>

    # Calculate the current
    i=np.minimum(Imax, P_act / V)
    return i

if __name__ == "__main__":

    # Subtask 4.2.3 Plot the FBSOA for the 3 time values.
    # Subtask 4.2.5 Mark three sample operating points on the FBSOA plot.

    plt.figure(figsize=(8, 6))
    # Calculate the currents
    I_dc = <Call function to calculate I_dc, I_1e4 AND i_1E5>

    plt.plot(V, I_dc,  label='DC')
    plt.plot(V, I_1e4, label=r'$10^{-4}\,\mathrm{s}$')
    plt.plot(V, I_1e5, label=r'$10^{-5}\,\mathrm{s}$')
    
    # Optionally maximum current and voltage can be insert to the plot
    plt.axhline(Imax, linewidth=1)
    plt.axvline(Vmax, linewidth=1)
    
    plt.xlim(0, Vmax*1.05)
    plt.ylim(0, Imax*1.1)
    plt.xlabel(r'Collector-emitter voltage $V_{CE}$ (V)')
    plt.ylabel(r'Collector current $I_C$ (A)')
    plt.title('Conceptual Forward-Bias SOA of an IGBT')
    plt.grid(True, linestyle='--', linewidth=0.5)
    plt.legend()
    plt.tight_layout()
    plt.show()

