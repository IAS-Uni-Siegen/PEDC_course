# Subtask 4.2.6 Plot three RBSOA boundaries corresponding to reapplied

# ---------------------------------------
# Reverse-bias SOA (RBSOA) clipping lines
# ---------------------------------------
# Piecewise linear upper-right clipping, tutorial-style
m_clip = 0.06  # common slope for all lines, tutorial assumption

<Calculate I_rbs_1000, I_rbs_2000 and I_rbs_3000 with m_clip V >
I_rbs_<dv/dt-voltage> = np.minimum(Imax, np.maximum(0, Imax - m_clip*(V - 800)))
I_rbs_<dv/dt-voltage> = np.minimum(Imax, np.maximum(0, Imax - m_clip*(V - 1000)))
I_rbs_<dv/dt-voltage> = np.minimum(Imax, np.maximum(0, Imax - m_clip*(V - 600)))


if __name__ == "__main__":
 
    # -------------------------------
    # Plot 2: RBSOA
    # -------------------------------
    plt.figure(figsize=(8, 6))
    plt.plot(V, I_rbs_1000, label=r'Reapplied $dv/dt = 1000\,\mathrm{V/\mu s}$')
    plt.plot(V, I_rbs_2000, label=r'Reapplied $dv/dt = 2000\,\mathrm{V/\mu s}$')
    plt.plot(V, I_rbs_3000, label=r'Reapplied $dv/dt = 3000\,\mathrm{V/\mu s}$')
    
     # Optionally maximum current and voltage can be insert to the plot
    plt.axhline(Imax, linewidth=1)
    plt.axvline(Vmax, linewidth=1)
    
    plt.xlim(0, Vmax*1.05)
    plt.ylim(0, Imax*1.1)
    plt.xlabel(r'Collector-emitter voltage $V_{CE}$ (V)')
    plt.ylabel(r'Collector current $I_C$ (A)')
    plt.title('Conceptual Reverse-Bias SOA of an IGBT')
    plt.grid(True, linestyle='--', linewidth=0.5)
    plt.legend()
    plt.tight_layout()
    plt.show()

