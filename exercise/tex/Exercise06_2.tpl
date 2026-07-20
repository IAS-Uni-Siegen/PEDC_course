# Subtask 6.2.1 Define constants and create a function for R_DS(on)(Tj).

Rds25 = 35e-3   # ohm at 25°C
<Add variable I_dt, I_cond, f_sw and Td>

Tj = np.linspace(25, 150, 300)
T_points = np.array([25, 100, 150])

<Add function calc_Rds_T to calculate Rds_T with Tj_val as input parameter>

# Subtask 6.2.2 Plot R_DS(on)(Tj) from 25°C to 150°C.

< calculate Rds_T>

plt.figure(figsize=(8, 5))
plt.plot(Tj, Rds_T * 1e3)
plt.xlabel(r'Junction temperature $T_j$ ($^\circ$C)')
plt.ylabel(r'$R_{\mathrm{DS(on)}}$ (m$\Omega$)')
plt.title('Part C: Temperature dependence of GaN on-resistance')
plt.grid(True, linestyle='--', linewidth=0.5)
plt.tight_layout()
plt.show()


# Subtask 6.2.3 Compute conduction loss at 10 A for 25°C, 100°C, and 150°C.

for T in T_points:
    < calculate Ract>
    Pcond = I_cond**2 * Ract
    print(f"Tj = {T:3.0f} °C -> R_DS(on) = {Ract*1e3:6.2f} mΩ, P_cond = {Pcond:5.2f} W")

# Subtask 6.2.4 and 6.2.5 Compare reverse conduction drop and dead-time loss.

# Case 1: gate actively driven ON during reverse conduction
< calculate R_on_25>
Vrev_on = I_dt * R_on_25

# Case 2: gate held OFF, with added channel re-establishment drop
Vrev_off = 2.5 + I_dt * R_on_25

<Calulate Edt_on by Vrev_on * I_dt * Td>
<Calculate Edt_off by Vrev_off * I_dt * Td>

<Calculate Pdt_on from Edt_on and f_sw>
<Calculate Pdt_off from Edt_off and f_sw>

print(f"Actively driven ON: V_rev = {Vrev_on:.3f} V, E_dt = {Edt_on*1e9:.3f} nJ, P_dt = {Pdt_on*1e3:.3f} mW")
print(f"Gate held OFF:      V_rev = {Vrev_off:.3f} V, E_dt = {Edt_off*1e9:.3f} nJ, P_dt = {Pdt_off*1e3:.3f} mW")








