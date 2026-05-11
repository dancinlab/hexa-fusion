# LIMIT_BREAKTHROUGH.md — hexa-fusion real-limits audit (Wave M)

> Universal real-limits audit per `LATTICE_POLICY.md §1.2`.
> Scope: thermonuclear fusion — magnetic (tokamak, stellarator), inertial (ICF), aneutronic concepts.
> SI units. Sources: **ITER Research Plan**, **NIF public results**, **Lawson 1957**, **EUROfusion DEMO concept**.

---

## §1 Domain identification

`hexa-fusion` covers fusion plasma physics and reactor engineering:
fusion/, fusion_powerplant/, examples/, build/, firmware/, plasma physics deep-dive verbs.

Two reactor families:
1. **Magnetic confinement (MCF)** — tokamak, stellarator, ITER, DEMO, SPARC, JT-60SA
2. **Inertial confinement (ICF)** — NIF (laser), Z-machine, FIA private (Helion, TAE, First Light)

The fundamental physical limit is the **Lawson criterion** (n·T·τ_E for ignition) — a HARD theorem of plasma physics, not an engineering challenge. Everything else (first-wall flux, tritium breeding, divertor heat load) is engineering.

---

## §2 Real limits applicable

| # | Limit | Class | Formula / value | Source |
|---|-------|-------|-----------------|--------|
| L1 | Lawson criterion (DT ignition) | Physical / HARD | n·T·τ_E ≥ 3×10²¹ keV·s/m³ | Lawson 1957; Wesson 2011 |
| L2 | Triple product current best (MCF) | Engineering / SOFT | JT-60U: 1.5×10²¹; ITER target: 6×10²¹ | JT-60U; ITER baseline |
| L3 | NIF ignition (Q_plasma > 1) | Engineering / DEMONSTRATED | Dec 2022: Q = 1.5; Aug 2023: Q = 1.9 | LLNL public 2022/2023 |
| L4 | First-wall heat flux | Engineering / HARD-ish | ~5 MW/m² sustained (W); ~20 MW/m² transient | ITER divertor TDR |
| L5 | Tritium breeding ratio (TBR) | Engineering / SOFT | TBR ≥ 1.05–1.15 required; current designs 1.1–1.2 (FW + blanket sim) | EUROfusion |
| L6 | Magnetic field (TF coil) | Engineering / SOFT | ITER NbTi/Nb₃Sn: 11.8 T peak; SPARC HTS: 12.2 T | ITER baseline; CFS/MIT |
| L7 | Plasma pressure (β) | Engineering / SOFT | Troyon limit β_N ≲ 4–5; current devices 2–3 | Troyon 1984 |
| L8 | Greenwald density limit | Engineering / HARD-ish | n_e ≲ I_p / (π·a²) (10²⁰ m⁻³ scale) | Greenwald 1988 |
| L9 | ICF laser energy (NIF) | Engineering / SOFT | 2.05 MJ delivered, 3.15 MJ fusion (Dec 2022) | LLNL |
| L10 | Carnot efficiency on plant | Physical / HARD | η ≤ 1 − T_c/T_h; DEMO ~35–40% net | EUROfusion |
| L11 | Aneutronic fuel ignition (p-B11) | Physical / HARD-ish | n·T·τ_E ≳ 30× DT; T ≳ 200 keV | Nevins-Carlson 2007 |
| L12 | Thermal conversion + Bremsstrahlung floor | Physical / HARD | P_brems ∝ Z²·n²·√T | textbook |

---

## §3 Per-limit breakthrough assessment

### L1 — Lawson criterion — **HARD_WALL (physical theorem)**

DT ignition requires n·T·τ_E ≥ 3×10²¹ keV·s/m³ at T ≈ 15 keV. This is a **physical theorem** derived from energy balance (fusion power vs Bremsstrahlung + transport). It cannot be "broken."

| Device | Triple product | Frac of Lawson |
|--------|----------------|----------------|
| JT-60U (1996, equivalent DT) | 1.5×10²¹ | 0.5 |
| JET DTE2 (2022) | ~1×10²¹ | 0.3 |
| ITER (target, 2035+) | 6×10²¹ | 2 |
| DEMO (target, 2050s) | 8×10²¹ | 2.7 |

**HARD_WALL.** Engineering approaches it; cannot exceed without violating energy balance.

### L2 — Triple product current best — **SOFT_WALL (engineering toward L1)**

Engineering scaling: bigger machine (R, B, I_p), better confinement (H-mode, advanced tokamak). ITER will demonstrate Q = 10 ~500 s. **SOFT_WALL.**

### L3 — NIF Q > 1 — **DEMONSTRATED but Q_wall < 1**

Dec 2022: 2.05 MJ laser → 3.15 MJ fusion → Q_plasma = 1.5.
But wall-plug efficiency of NIF lasers ~0.5% → Q_wall ≈ 3.15 MJ / 400 MJ_wall ≈ 0.008.
Honest verdict: **plasma-level breakthrough real**; **plant-level breakeven NOT achieved**; ICF reactor concepts (LIFE, Marvel) require ~10–20% laser efficiency. **SOFT_WALL on Q_wall.**

### L4 — First-wall heat flux ~5 MW/m² — **HARD-ish**

Tungsten monoblock divertor: ~10–20 MW/m² transient, ~5 MW/m² sustained. Material limits (recrystallization at ~1300 °C, sputtering, neutron damage to 20+ dpa) approach physical ceiling.
**SOFT_WALL** in 1–10 yr but **HARD-ish** at multi-decade lifetime under 14 MeV neutron flux.
Alternative: liquid metal divertors (Li, Sn) — R&D stage.

### L5 — Tritium breeding ratio — **SOFT_WALL**

TBR ≥ 1.05–1.15 required for self-sufficiency. Lithium blankets (Pb-Li, Li₂TiO₃) designs reach 1.1–1.2 in sim. Engineering challenges: Be multiplier supply, neutron leakage, isotope tailoring. **SOFT_WALL.**

### L6 — TF magnet 12 T HTS — **BREAKABLE_WITH_TECH**

SPARC (CFS/MIT) HTS toroidal field 12.2 T — demonstrated full-scale model coil 2021. Enables compact reactor (R = 1.85 m vs ITER R = 6.2 m).
**BREAKABLE_WITH_TECH** — REBCO HTS @ 20 K vs LTS @ 1.9 K enables higher B at same cryo cost. ARC concept targets 9.2 T at-axis, 23 T at coil.

### L7 — Troyon β limit — **HARD-ish**

β_N = β · a·B/I ≲ 4.4 (Troyon scaling). MHD-stability bound. Spherical tokamaks (MAST, NSTX) push β > 0.4. Advanced tokamak (ITER hybrid) target β_N ≈ 3. **HARD_WALL on ideal MHD**; **SOFT_WALL on operational fraction.**

### L8 — Greenwald density limit — **HARD-ish (empirical scaling)**

n_GW = I_p / (π·a²) × 10²⁰ m⁻³. Empirically robust; theoretical origin debated (edge cooling cascade). Operational devices typically 0.5–1.0·n_GW. **HARD-ish, empirical.**

### L9 — NIF 2.05 MJ — **SOFT_WALL**

Engineering frontier on laser energy + uniformity. NIF could upgrade to ~3 MJ; future ICF (Marvel Fusion, LIFE) target ~10 MJ at 10–100 Hz. **SOFT_WALL.**

### L10 — Carnot on the heat-to-electricity chain — **HARD_WALL**

η_Carnot = 1 − T_c/T_h. DEMO target: T_h ≈ 550 °C (Pb-Li outlet) → η ≈ 38–42%. **HARD_WALL** — same as any thermal plant.

### L11 — Aneutronic p-B11 — **HARD-ish (physics-limited)**

Requires T ≈ 200 keV (vs DT 15 keV) and n·τ ~30× DT. Bremsstrahlung loss scales as Z²; at p-B11 conditions, P_brems ≳ P_fusion under standard reactor parameters (Nevins-Carlson 2007 PRE).
TAE/HB11 propose non-thermal beam-target schemes to evade — disputed. **HARD-ish** for thermal reactors.

### L12 — Bremsstrahlung floor — **HARD_WALL**

P_brems ∝ n²·Z²·√T. Cannot be reduced for given plasma composition. Pure D-D / D-T fusion: Bremsstrahlung manageable. Aneutronic: bremsstrahlung often exceeds fusion → energy-balance HARD wall.

---

## §4 Top-3 breakthrough opportunities (honest)

### #1 — HTS-enabled compact tokamak (SPARC/ARC, real)

- **Limit type**: BREAKABLE_WITH_TECH on B-field, reactor size
- **Current**: SPARC TFMC tested at 20.1 T (CFS, 2021); SPARC Q > 2 target 2027
- **Path**: REBCO HTS coil → compact net-energy device
- **Honest verdict**: **real**. Could deliver fusion Q > 10 in ~m-scale device years before ITER. But Lawson criterion (L1) still HARD — they push toward it, not past it.

### #2 — Inertial fusion at Q_wall > 1 (LLNL + private, on path)

- **Limit type**: SOFT_WALL on laser wall-plug efficiency (0.5% → 10–20%)
- **Current**: NIF Q_plasma = 1.9 (2023); Q_wall ≈ 0.01
- **Path**: diode-pumped solid-state lasers (DPSSL), 10–100 Hz rep rate (Marvel, Focused Energy)
- **Honest verdict**: real engineering frontier; net-electricity ICF requires ~1000× efficiency gain — possible over decade, not guaranteed.

### #3 — Stellarator confinement (Wendelstein 7-X, real)

- **Limit type**: SOFT_WALL on steady-state confinement (no current drive needed)
- **Current**: W7-X record τ_E·n·T ≈ 6.8×10²⁶ m⁻³·s·K (Aug 2023, 8 min)
- **Path**: optimized 3D coils, plasma-facing W, divertor cooling
- **Honest verdict**: real — stellarators avoid disruptions, enable steady-state. But still subject to Lawson HARD_WALL.

### Not in top-3 (over-hyped or distant)

| Claim | Reality |
|-------|---------|
| "Cold fusion / LENR" | No peer-reproducible evidence in 35 yr; DOE/EPRI reviews null. **HARD_WALL.** |
| "Aneutronic p-B11 commercial in 2030s" | Bremsstrahlung-dominated under thermal conditions; needs non-thermal scheme not yet demonstrated. **HARD-ish.** |
| "Fusion 'breaks energy conservation'" | Never — E = mc² conversion of binding energy; fully conservative. **Not a limit-break.** |
| "Q_plasma = 1.9 means commercial fusion" | Plant-level breakeven requires Q_wall ≫ 1 including blanket, cryo, balance-of-plant. Decades away. |

---

## §5 Honest caveats

1. **Lawson criterion is a HARD_WALL.** Every fusion "breakthrough" in the literature is engineering scaling *toward* Lawson, not past it. Media coverage frequently conflates plasma Q with plant Q.
2. **Carnot efficiency (L10) is a HARD_WALL** at the thermal-conversion step — fusion plants are heat engines with η ≲ 40%.
3. **NIF's 2022 ignition is a real physical milestone** (first laboratory plasma with Q > 1) — but it does NOT mean commercial fusion is imminent. Q_wall remains ≪ 1.
4. **Tritium supply is a separate hard wall.** World stockpile ~30 kg (2024); DT fusion plant consumes ~50 kg/yr/GW. TBR ≥ 1 self-breeding is **mandatory for commercial DT**.
5. **HARD walls in fusion**: Lawson, Bremsstrahlung, Carnot, first-wall material physics. **SOFT walls**: device size, laser efficiency, magnet field, TBR.
6. **Lattice disclaimer (LATTICE_POLICY §1.2)**: Lawson 3×10²¹ is a physical theorem, not an n=6 projection. ITER parameters (R = 6.2 m, B = 5.3 T axial) are ITER-specified.

---

## §6 References

- Lawson J.D., Proc. Phys. Soc. B 70, 6 (1957)
- Wesson J., *Tokamaks*, 4th ed. (2011), Oxford
- **ITER Research Plan**, ITR-18-003 (2018, public)
- **NIF Ignition Results**, Abu-Shawareb et al., *PRL* 132, 065102 (2024)
- **SPARC TFMC**, Whyte D. et al., *Nature Energy* 6, 1018 (2021)
- **W7-X record**, Wolf R.C. et al., Nucl. Fusion (2024)
- Greenwald M. et al., Nucl. Fusion 28, 2199 (1988)
- Troyon F. et al., Plasma Phys. Controlled Fusion 26, 209 (1984)
- Nevins W.M., Carlson R., Fusion Sci. Technol. 52, 1153 (2007) — p-B11 Bremsstrahlung
- **EUROfusion DEMO Concept**, Federici G. et al., Fusion Eng. Des. 109, 1464 (2016)
- **JET DTE2 results**, Maslov M. et al., Nucl. Fusion 63, 112002 (2023)
- **DOE LENR review** (2004) — null findings

---

*Audit wave: M. Authored by 박민우 <nerve011235@gmail.com>. No n=6 lattice anchoring of fusion parameters (LATTICE_POLICY §1.2). Lawson criterion is physical theorem (HARD). All operational parameters from ITER, NIF, JET, SPARC, W7-X public results.*
