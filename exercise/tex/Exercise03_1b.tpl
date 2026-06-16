if __name__ == "__main__":
    # Subtask 3.1.6 Plot E_sw versus R_g
    # Generate the plot
    plt.figure(figsize=(10, 6))
    for i, act_Q_GD in enumerate(Q_GD):
        # Calculate gate current
        I_g = get_I_g(R_g)
        # Calculate Miller time
        <Add calculation>
        # Calculate Energy loss
        <Add calculation>
        # Create legend per result
        text=f"Q_GD={act_Q_GD}"
        plt.scatter(R_g, E_sw, label=text, color=color_list[i], marker=marker_list[i])

    plt.xlabel(r'Resistance in Ohm')
    plt.ylabel('Energy loss in Joule')
    plt.title('Energy loss versus gate resistance')
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.legend()
    plt.tight_layout()
    plt.show()
