if __name__ == "__main__":
    # Subtask 3.2.7 Plot total loss versus frequency at fixed current within the given current range for all devices.

    # Define fixed current (middle)
    fixed_current = 25
    plot_colors = ['red', 'blue', 'green']

    # Calculate rms-current
    I_rms = <Call function>


    # Generate the plot
    plt.figure(figsize=(10, 6))
    # For-loop over devices
    for i, act_device_name in enumerate(Devices):
        act_device=Devices[act_device_name]
        # Calculate conduction power loss
        P_closs = <Call function>
        # Calculate switching power loss
        P_sloss = <Call function>
        # Calculate the total loss
        P_tot =<Call function>
        # Create legend per result
        text=act_device_name
        plt.plot(f_s_range/1000, P_tot, label=text, color=plot_colors[i])
            

    plt.xlabel("Switching frequency in kHz")
    plt.ylabel("Power loss in W")
    plt.title(f"Total power loss versus switching frequency at drain source current={fixed_current}A")
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.legend()
    plt.tight_layout()
    plt.show()

