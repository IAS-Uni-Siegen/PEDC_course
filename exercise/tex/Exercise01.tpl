import numpy as np
import matplotlib.pyplot as plt

# ---------------------------------------------------------------------
# Fixed constants and material data for the tutorial
# ---------------------------------------------------------------------
q = 1.602176634e-19              # C
k_eV = 8.617333262145e-5         # eV/K

materials = {
    'Ge':  {'Eg': 0.66, 'Nc': 1.04e19, 'Nv': 6.0e18,  'mu_n': 3900.0, 'mu_p': 1900.0},
    'Si':  {<Add data for the material>},
    'SiC': {<Add data for the material>},
    'GaN': {<Add data for the material>},{<Add data for the material>}
}

def intrinsic_carrier_concentration(Eg, Nc, Nv, T):
    return <Add calculation>

def solve_carriers(ni, ND, NA=0.0):
    # Equilibrium electron and hole concentrations from charge neutrality and mass action.
    <Add calculation>
    return n, p

def conductivity(q, n, p, mu_n, mu_p):
    # Conductivity in S/cm when n, p are in cm^-3 and mobility in cm^2/(V s).
    return <Add calculation>

def resistivity(sigma):
    return <Add calculation>

def hall_coefficient_n_type(q, n):
    # Single-carrier estimate in cm^3/C for n-type-dominant material.
    return <Add calculation>

def fermi_shift_from_intrinsic(n, ni, T):
    # E_F - E_i in eV for non-degenerate n-type cases.
    return <Add calculation>

print("Fixed constants used in this tutorial")
print(f"  q    = {q:.6e} C")
print(f"  k    = {k_eV:.6e} eV/K")
print("\nMaterial values")
for name, mat in materials.items():
    print(f"  {name}: Eg = {mat['Eg']:.2f} eV, Nc = {mat['Nc']:.2e} cm^-3, Nv = {mat['Nv']:.2e} cm^-3, "
          f"mu_n = {mat['mu_n']:.0f} cm^2/Vs, mu_p = {mat['mu_p']:.0f} cm^2/Vs")



# ---------------------------------------------------------------------
# Part A - Material comparison at T = 300 K, intrinsic case
# ---------------------------------------------------------------------
T_A = 300.0
material_names = ['Ge', 'Si', 'SiC', 'GaN']

ni_A = []
sigma_i_A = []

for name in material_names:
    mat = materials[name]
    ni = <Add calculation/function call>
    sigma_i = <Add calculation/function call>
    ni_A.append(ni)
    sigma_i_A.append(sigma_i)
    print(f"{name:>3s} at {T_A:.0f} K: ni = {ni:.3e} cm^-3, sigma_i = {sigma_i:.3e} S/cm")

ni_A = np.array(ni_A)
sigma_i_A = np.array(sigma_i_A)

plt.figure(figsize=(10, 6))
plt.bar(material_names, ni_A)
plt.yscale('log')
plt.ylabel(r'Intrinsic carrier concentration $n_i$ (cm$^{-3}$)')
plt.title('Part A1: Intrinsic carrier concentration of Ge, Si, SiC, and GaN at 300 K')
plt.grid(True, which='both', linestyle='--', linewidth=0.5, axis='y')
plt.tight_layout()
plt.show()

plt.figure(figsize=(10, 6))
plt.bar(material_names, sigma_i_A)
plt.yscale('log')
plt.ylabel(r'Intrinsic conductivity $\sigma_i$ (S/cm)')
plt.title('Part A2: Intrinsic conductivity of Ge, Si, SiC, and GaN at 300 K')
plt.grid(True, which='both', linestyle='--', linewidth=0.5, axis='y')
plt.tight_layout()
plt.show()



# ---------------------------------------------------------------------
# Part B - Donor-doping sweep in silicon at T = 300 K
# ---------------------------------------------------------------------
mat = materials['Si']
T_B = 300.0
NA_B = 0.0
ND_task = np.array([1e14, 1e15, 1e16, 1e17, 1e18])     # explicit task values
ND_plot = np.logspace(14, 18, 300)                     # dense sweep for smooth plots

ni_B = <Add calculation/function call>
n_B, p_B = <Add calculation/function call>
sigma_B = <Add calculation/function call>
rho_B = <Add calculation/function call>
RH_B = <Add calculation/function call>
EFEi_B = <Add calculation/function call>

# Values exactly requested in the task statement
n_task, p_task = <Add calculation/function call>
sigma_task = <Add calculation/function call>
rho_task = <Add calculation/function call>
RH_task = <Add calculation/function call>
EFEi_task = <Add calculation/function call>

print(f"Silicon at {T_B:.0f} K: ni = {ni_B:.3e} cm^-3")
print("\nTask values for Part B")
print("ND (cm^-3)      n (cm^-3)        p (cm^-3)        sigma (S/cm)     rho (ohm*cm)     RH (cm^3/C)      EF-Ei (eV)")
for ND_i, n_i, p_i, s_i, r_i, RH_i, E_i in zip(ND_task, n_task, p_task, sigma_task, rho_task, RH_task, EFEi_task):
    print(f"{ND_i:>10.2e}   {n_i:>12.3e}   {p_i:>12.3e}   {s_i:>12.3e}   {r_i:>12.3e}   {RH_i:>12.3e}   {E_i:>10.3f}")

plt.figure(figsize=(10, 6))
plt.loglog(ND_plot, n_B, label=r'Electron concentration $n$')
plt.loglog(ND_plot, p_B, label=r'Hole concentration $p$')
plt.axhline(ni_B, linestyle='--', label=r'$n_i$ at 300 K')
plt.scatter(ND_task, n_task, marker='o')
plt.scatter(ND_task, p_task, marker='s')
plt.xlabel(r'Donor concentration $N_D$ (cm$^{-3}$)')
plt.ylabel(r'Carrier concentration (cm$^{-3}$)')
plt.title('Part B1: Majority and minority carriers in n-type silicon')
plt.grid(True, which='both', linestyle='--', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()

plt.figure(figsize=(10, 6))
plt.loglog(ND_plot, sigma_B, label=r'Conductivity $\sigma$')
plt.loglog(ND_plot, rho_B, label=r'Resistivity $\rho$')
plt.scatter(ND_task, sigma_task, marker='o')
plt.scatter(ND_task, rho_task, marker='s')
plt.xlabel(r'Donor concentration $N_D$ (cm$^{-3}$)')
plt.ylabel('Conductivity / Resistivity')
plt.title('Part B2: Conductivity rises and resistivity falls with donor doping')
plt.grid(True, which='both', linestyle='--', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()

fig, ax1 = plt.subplots(figsize=(10, 6))
ax1.semilogx(ND_plot, RH_B, label=r'Hall coefficient $R_H$')
ax1.scatter(ND_task, RH_task, marker='o')
ax1.set_xlabel(r'Donor concentration $N_D$ (cm$^{-3}$)')
ax1.set_ylabel(r'Hall coefficient $R_H$ (cm$^3$/C)')
ax1.grid(True, which='both', linestyle='--', linewidth=0.5)

ax2 = ax1.twinx()
ax2.semilogx(ND_plot, EFEi_B, color='tab:red', label=r'$E_F - E_i$')
ax2.scatter(ND_task, EFEi_task, color='tab:red', marker='s')
ax2.set_ylabel(r'$E_F - E_i$ (eV)', color='tab:red')
ax2.tick_params(axis='y', labelcolor='tab:red')

plt.title('Part B3: Hall coefficient magnitude and Fermi-level shift vs donor doping')
plt.tight_layout()
plt.show()




# ---------------------------------------------------------------------
# Part C - Thermal stability comparison: Si versus GaN
# ---------------------------------------------------------------------
ND_C = 1e14
NA_C = 0.0
T_values = np.array([300.0, 450.0, 600.0])
compare_materials = ['Si', 'GaN']

results = {}
for name in compare_materials:
    mat = materials[name]
    ni_list = []
    n_list = []
    p_list = []
    sigma_list = []
    RH_list = []
    EFEi_list = []

    for T in T_values:
        <Add your code here>

    results[name] = {
        'ni': np.array(ni_list),
        'n': np.array(n_list),
        'p': np.array(p_list),
        'sigma': np.array(sigma_list),
        'RH': np.array(RH_list),
        'EFEi': np.array(EFEi_list),
    }

print(f"Part C fixed doping: ND = {ND_C:.1e} cm^-3, NA = {NA_C:.1e} cm^-3")
for name in compare_materials:
    print(f"\n{name} results")
    print("T (K)      ni (cm^-3)        n (cm^-3)        p (cm^-3)        sigma (S/cm)     RH (cm^3/C)      EF-Ei (eV)")
    for T, ni_i, n_i, p_i, s_i, RH_i, E_i in zip(
        T_values, results[name]['ni'], results[name]['n'], results[name]['p'],
        results[name]['sigma'], results[name]['RH'], results[name]['EFEi']
    ):
        print(f"{T:>5.0f}   {ni_i:>12.3e}   {n_i:>12.3e}   {p_i:>12.3e}   {s_i:>12.3e}   {RH_i:>12.3e}   {E_i:>10.3f}")

plt.figure(figsize=(10, 6))
for name in compare_materials:
    plt.semilogy(T_values, results[name]['ni'], marker='o', label=f'{name}')
plt.xlabel('Temperature (K)')
plt.ylabel(r'Intrinsic carrier concentration $n_i$ (cm$^{-3}$)')
plt.title('Part C1: Temperature dependence of $n_i$ for Si and GaN')
plt.grid(True, which='both', linestyle='--', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()

plt.figure(figsize=(10, 6))
for name in compare_materials:
    plt.semilogy(T_values, results[name]['sigma'], marker='o', label=f'{name}')
plt.xlabel('Temperature (K)')
plt.ylabel(r'Conductivity $\sigma$ (S/cm)')
plt.title('Part C2: Conductivity versus temperature at fixed donor doping')
plt.grid(True, which='both', linestyle='--', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()

plt.figure(figsize=(10, 6))
for name in compare_materials:
    plt.plot(T_values, results[name]['EFEi'], marker='o', label=f'{name}')
plt.xlabel('Temperature (K)')
plt.ylabel(r'$E_F - E_i$ (eV)')
plt.title('Part C3: Fermi-level shift versus temperature at fixed donor doping')
plt.grid(True, linestyle='--', linewidth=0.5)
plt.legend()
plt.tight_layout()
plt.show()





























