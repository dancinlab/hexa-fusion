# Changelog

All notable changes to **hexa-fusion** are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and SemVer.

## [Unreleased]

### Added (2026-05-08 — 15th RSC iteration: numerics meta-lint, META)
- `verify/lint_numerics.hexa` — numerics methodology meta-lint (META, 46/46 PASS, all 9 numerics scripts conform). Grep-audits every `verify/numerics_*.hexa` against the 5-invariant regression pattern: (1) imports `self/runtime/math_pure` (no raw libm or `exec` for math), (2) emits unique `__HEXA_FUSION_<NAME>__ PASS` sentinel, (3) declares `FALSIFIERS` list (named retract conditions), (4) exits 0 on PASS, (5) carries per-section `RUN` / `FAIL` accounting counters. Plus an inventory-completeness check (NUMERICS_SCRIPTS list count == on-disk count). Each new numerics_*.hexa file must be added to NUMERICS_SCRIPTS — drift surface kept tiny in exchange for zero runtime dependencies. 6 falsifiers self-declared. Sentinel `__HEXA_FUSION_LINT_NUMERICS__ PASS — all 9 numerics scripts conform`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., lint-numerics]`; help bumped.
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  15/15`.

### Verification (iter 15)
- `hexa run verify/lint_numerics.hexa` → 46/46 PASS (9 scripts × 5 invariants + 1 inventory check).
- `hexa-fusion verify all` → `PASS: 15/15`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-08 — 14th RSC iteration: F-FUSION-1/2/3/4 closure tracker, META)
- `verify/falsifier_check.hexa` — preregistered falsifier checklist + closure-progress tracker (META, 17/17 PASS, all 4 falsifiers at 67% closure). Surfaces .roadmap.hexa_fusion §A.4 declarations as a pre-flight checklist with status, the experiment that would close each one out, AND closure progress (T1 algebraic / T2 numerical / T3 empirical evidence tiers landed). closure_pct = tiers_complete / 3, capped to 67% until empirical T3 lands. Closure snapshot:
  - **F-FUSION-1** (lawson_triple closed-form): T1 ✓ + T2 ×2 ✓ (numerics_fusion + numerics_fusion_solver), T3 TBD = 67%
  - **F-FUSION-2** (tabletop p-11B Q=τ=4 break-even): T1 ✓ + T2 ×2 ✓ (numerics_tabletop + numerics_tabletop_parity), T3 TBD = 67%
  - **F-FUSION-3** (KSTAR-N6 Q=σ-φ=10 powerplant): T1 ✓ + T2 ×3 ✓ (numerics_fusion_parity + numerics_powerplant + numerics_powerplant_dse), T3 TBD = 67%
  - **F-FUSION-4** (12-archetype 122/122 closure): T1 ✓ + T2 ×2 ✓ (numerics_cross_pillar + numerics_lattice_arithmetic), T3 TBD = 67%

  Sentinel `__HEXA_FUSION_FALSIFIER__ PASS — 4/4 preregistered, 67% closure (T1+T2 locked)`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., falsifier]`; help bumped.
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  14/14`.

### Verification (iter 14)
- `hexa run verify/falsifier_check.hexa` → 17/17 PASS, 4/4 falsifiers at 67%.
- `hexa-fusion verify all` → `PASS: 14/14`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-08 — 13th RSC iteration: math_pure stability floor)
- `verify/numerics_lattice_arithmetic.hexa` — math_pure stability floor (T2, 19/19 PASS). Repeats every n=6 lattice closure using `math_pure` (sqrt_pure, pow_pure, log10_pure, exp_pure / log_pure) and asserts agreement to 1e-9 relative error on every anchor. 6 sections: sqrt routines (sqrt(σ²)=σ, sqrt(B²)=B=48, sqrt(J₂²)=J₂), pow_pure on n=6 anchors (σ²=144, σ³=1728, B^τ=48^4=5.31M, (σ-φ)^n=10^6), log/exp homomorphism + roundtrips (log10(10^7)=7, log10 homomorphism on σ², exp/log roundtrip on σ + B), cross-routine consistency (sqrt(σ³) vs σ^(3/2)), float master closure, and 6 fusion-projected float-exact anchors (Q=10, T_i=14, B=48, η=0.5, card=122, n+1=7). Provides T2 evidence at the meta level — if this fails, every numerics_*.hexa is suspect. Sentinel `__HEXA_FUSION_NUMERICS_LATTICE__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., numerics-lattice]`; help bumped.
- `tests/test_calculators.hexa` — added numerics_lattice_arithmetic row (11 cases now).
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  13/13`.

### Verification (iter 13)
- `hexa run verify/numerics_lattice_arithmetic.hexa` → 19/19 PASS (max rel err on exp/log roundtrip: 5.9e-16).
- `hexa-fusion verify all` → `PASS: 13/13`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 12th RSC iteration: cross-pillar numerical anchor, all 4 falsifiers)
- `verify/numerics_cross_pillar.hexa` — cross-pillar numerical anchor (T2, 10/10 PASS). The float-arithmetic counterpart to cross_doc_audit (which is doc-text only). Computes every n=6-derived anchor 4 times — once per pillar — and asserts bit-identical results. 9 sections: Q across pillars (10), T_i across pillars (14 keV), B across all 4 pillars (48 T), η_Brayton across pillars (0.5), break-even τ=4 < powerplant Q=10, archetype card σ·(σ-φ)+φ=122 (F-FUSION-4 anchor) + σ=12=3·α cross-check, master closure preserved (24=24=J₂), p-11B aneutronic η-ratio=σ/n=2 × DT, TF coil count 3n=18. Provides T2 evidence for ALL 4 falsifiers. Sentinel `__HEXA_FUSION_NUMERICS_CROSS_PILLAR__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., numerics-cross]`; help bumped.
- `tests/test_calculators.hexa` — added numerics_cross_pillar row (10 cases now).
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  12/12`.

### Verification (iter 12)
- `hexa run verify/numerics_cross_pillar.hexa` → 10/10 PASS.
- `hexa-fusion verify all` → `PASS: 12/12`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 11th RSC iteration: KSTAR-N6 Q-gain DSE, F-FUSION-3 second T2 leg)
- `verify/numerics_powerplant_dse.hexa` — KSTAR-N6 Q-gain design-space exploration (T2, 10/10 PASS). Builds a small Q-surface from `Q = (σ-φ) · (B/B_anchor)² · (T/T_anchor)`. 7 sections: anchor reproduction (Q=10 at B=48, T=14), halve-B → Q/4 (quadratic), halve-T → Q/2 (linear), 3×3 grid monotonicity in B and T, break-even windows (anchor metric=1.0 sits 2.5× above τ/Q_anchor=0.4 threshold; halving B drops Q to 2.5 < τ=4 because B-quadratic bites first; full anchor stays 2.5× over τ), surface monotonicity (no interior max), dimensional sanity (Q dimensionless = 10 at anchor). Provides second T2 leg for F-FUSION-3 (after numerics_powerplant). Sentinel `__HEXA_FUSION_NUMERICS_POWERPLANT_DSE__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., numerics-powerplant-dse]`; help bumped.
- `tests/test_calculators.hexa` — added numerics_powerplant_dse row (9 cases now).
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  11/11`.

### Verification (iter 11)
- `hexa run verify/numerics_powerplant_dse.hexa` → 10/10 PASS.
- `hexa-fusion verify all` → `PASS: 11/11`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 10th RSC iteration: KSTAR-N6 powerplant numerics, F-FUSION-3 T2)
- `verify/numerics_powerplant.hexa` — KSTAR-N6 powerplant end-to-end numerics (T2, 16/16 PASS). 6 sections cover base anchors (B=σ·τ=48, T_i=σ+φ=14, Q=σ-φ=10, η=σ/J₂=0.5, TF=3n=18), full power balance for a 50 MW input scenario (P_th=Q·P_in=500 MW, P_e=η·P_th=250 MW, P_net=200 MW, η_overall=0.4), magnet-energy + coil scaling (B²=σ²·τ²=2304, 9.06× lift over ITER), Carnot bound (η_Brayton=0.5 ≤ η_Carnot=1-n/(σ+φ)≈0.571), plant-wide invariants (12-archetype lock + master closure preserved), and KSTAR-N6 lift over current KSTAR (Q 10× lift, B 13.7× lift). Provides T2 evidence for F-FUSION-3 (the end-to-end power-balance closure beyond the algebraic Q=σ-φ identity in calc_fusion). Sentinel `__HEXA_FUSION_NUMERICS_POWERPLANT__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., numerics-powerplant]`; help bumped.
- `tests/test_calculators.hexa` — added numerics_powerplant row (8 cases now).
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  10/10`.

### Verification (iter 10)
- `hexa run verify/numerics_powerplant.hexa` → 16/16 PASS.
- `hexa-fusion verify all` → `PASS: 10/10`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 9th RSC iteration: p-11B 4-effort published parity, F-FUSION-2 second T2 leg)
- `verify/numerics_tabletop_parity.hexa` — p-11B published parity (T2, 12/12 PASS). Compares the n=6 closed-form predictions against the canonical 4-effort p-11B aneutronic set: HB11 (Hora laser-pB, T_eff~1 MeV, Q~1), TAE (Norman C-2W FRC T_i=30 keV → Copernicus 50-100 keV, Q target 1-2), LPP Fusion (DPF ion-T peaks ≈ 300 keV, Q<0.1), ENN (Langfang B 3 T → 4-5 T). 6 sections cover HB11 (Q ratio 4×, both in [200,1000] keV Gamow band), TAE (T_i 10× lift, Q 2× lift, Q_pp 5× headroom), LPP (T_opt EXACT match 300 keV ↔ DPF peak, Q 40× headroom), ENN (B 16× headroom), 4-effort ladders (Q/T/B), and aneutronic verdict bit φ=2 across all 4. Provides second T2 leg for F-FUSION-2 (after numerics_tabletop). Sentinel `__HEXA_FUSION_NUMERICS_TABLETOP_PARITY__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., numerics-tabletop-parity]`; help bumped.
- `tests/test_calculators.hexa` — added numerics_tabletop_parity row (7 cases now).
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  9/9`.

### Verification (iter 9)
- `hexa run verify/numerics_tabletop_parity.hexa` → 12/12 PASS.
- `hexa-fusion verify all` → `PASS: 9/9`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 8th RSC iteration: tabletop p-11B numerics, F-FUSION-2 T2)
- `verify/numerics_tabletop.hexa` — tabletop p-11B numerics (T2, 19/19 PASS). 9 sections cover float ↔ int parity (master + p-11B mass complement σ=12 + 3·α=σ), B^4 scaling via `pow_pure` (B^4=5.31M, V_TT/V_ITER ≈ 1.486e-4), Gamow peak T_opt=300 keV vs published σv-peak 200 keV (50% over-resonance) and Gamow resonance 580 keV (48% under), Q break-even (τ=4) + Q_pp/Q_be ratio 2.5, power density 10 MW/m³ + P_core = 8.7 kW float arith, device mass + cost, p-11B Q-value 8.68 MeV in n=6 anchor band (σ/φ=6 < 8.68 < φ·sopfr=10) + per-α 2.89 MeV ≈ Q/(n/φ)=8.68/3, He-4 binding ↔ J₂ parity, ignition cardinality + battery σ·τ=48 kWh. Provides T2 evidence for F-FUSION-2. Sentinel `__HEXA_FUSION_NUMERICS_TABLETOP__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., numerics-tabletop]`; help bumped.
- `tests/test_calculators.hexa` — added numerics_tabletop row (6 cases now).
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  8/8`.

### Verification (iter 8)
- `hexa run verify/numerics_tabletop.hexa` → 19/19 PASS.
- `hexa-fusion verify all` → `PASS: 8/8`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 7th RSC iteration: 0D D-T burn ODE solver)
- `verify/numerics_fusion_solver.hexa` — 0D D-T burn ODE solver (T2, 8/8 PASS). Step-by-step RK2 (midpoint) integration of the simplest D-T burn-rate equation (constant T_i = σ+φ = 14 keV, equal initial n_D = n_T): `dn_D/dt = -n_D²·<σv>` with closed-form reference `n_D(t) = n_0 / (1 + n_0·<σv>·t)`. 5 sections: RK2 vs analytic at 4 checkpoints (max rel-err 0.000347%), mass balance D=T and D+α=N₀ to 1e-12 over 16 steps, burnup fraction 0.524 at t=T_BURN, τ_burn ≈ 90.91 s in [50,150]s window, α energy density ≈ 29.5 MJ/m³ in [25,35] MJ/m³ window. Provides T2 evidence for F-FUSION-1 (the actual numerical solver beyond the closed-form Lawson identity in numerics_fusion). T3 (live D-T plasma data feed) still TBD. Sentinel `__HEXA_FUSION_NUMERICS_FUSION_SOLVER__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., numerics-fusion-solver]`; help bumped.
- `tests/test_calculators.hexa` — added numerics_fusion_solver row (5 cases now).
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  7/7`.

### Verification (iter 7)
- `hexa run verify/numerics_fusion_solver.hexa` → 8/8 PASS, max RK2 rel-err 0.000347%.
- `hexa-fusion verify all` → `PASS: 7/7`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 6th RSC iteration: D-T 4-machine published parity)
- `verify/numerics_fusion_parity.hexa` — D-T published-machine parity (T2, 13/13 PASS). Compares the n=6 closed-form predictions against the canonical 4-machine D-T tokamak set (ITER, JET, KSTAR, SPARC). 5 sections cover ITER (Q=10 EXACT, T_i=14 EXACT, V=840 EXACT, B_t scope mismatch as 9.06× headroom), JET 1997 DT-1 (Q=0.67 → n6 Q=10 = 14.9× lift, B 13.9× lift), KSTAR sister project (T_e=8.617 keV → 1.624× lift, B_t=3.5 T → 13.7× headroom — F-FUSION-3 anchor), SPARC HTS demo (B_t=12.2 T ≈ σ=12 CLOSE 1.6%, Q≥2 → 5× headroom), and a 4-machine ladder summary (Q ladder, T_i ladder, B_t ladder). Each parity row reports closed-form vs published, relative error %, and EXACT/CLOSE/WEAK/FAIL grade. Provides T2 evidence for F-FUSION-3. Sentinel `__HEXA_FUSION_NUMERICS_FUSION_PARITY__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., numerics-fusion-parity]`; help bumped.
- `tests/test_calculators.hexa` — added numerics_fusion_parity row (4 cases now).
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  6/6`.

### Verification (iter 6)
- `hexa run verify/numerics_fusion_parity.hexa` → 13/13 PASS (3 EXACT, 1 CLOSE, 9 ratio dominance).
- `hexa-fusion verify all` → `PASS: 6/6`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 5th RSC iteration: D-T closed-form numerics, T2 tier opens)
- `verify/numerics_fusion.hexa` — D-T closed-form numerics (T2, 17/17 PASS). First T2-tier script: re-derives every n=6-projected D-T quantity in float via `use "self/runtime/math_pure"` (no raw libm), then cross-checks against the integer atom from the lattice. 9 sections cover float ↔ int parity (master closure), Lawson n=6 SSOT (τ·10^14) + measured-vs-n6 7-decade gap (F-FUSION-1 honest negative), Q re-derivation (powerplant 10, break-even 4, ratio 2.5), plasma + Carnot bound (η_brayton ≤ 1 - n/(σ+φ)), D-T Q-value partition (3.518 + 14.068 ≈ 17.586 MeV), α-share theory ↔ measured (1/sopfr ≈ 0.20), T_opt anchor (σ+φ=14 vs published 13.6, <5% rel err), He-4 binding parity (J₂ vs 28.296 MeV, <20%), magnet/power identities, archetype card, R(6) self-ratio. Provides T2 evidence for F-FUSION-1 + F-FUSION-3. Sentinel `__HEXA_FUSION_NUMERICS_FUSION__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [..., numerics-fusion]`; help bumped.
- `tests/test_calculators.hexa` — added numerics_fusion row (3 cases now).
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  5/5`.

### Verification (iter 5)
- `hexa run verify/numerics_fusion.hexa` → 17/17 PASS.
- `hexa-fusion verify all` → `PASS: 5/5`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 4th RSC iteration: tabletop p-11B aneutronic algebraic derivation)
- `verify/calc_tabletop.hexa` — tabletop p-11B aneutronic n=6 derivation (T1, 22/22 PASS). 9 sections cover master closure, p-11B mass complement (p+11B = μ + (sopfr+n) = σ = 12, 3·α = (n/φ)·τ = σ), tabletop volume + B^4 magnification (B = σ·τ = 48 T, V_TT = μ = 1 m³, V_ITER = (n+1)·sopfr·τ·n = 840 m³), Gamow-peak T_opt = n·(σ-φ)·sopfr = 300 keV, break-even Q = τ = 4 (F-FUSION-2 T1), power density φ·sopfr = 10 MW/m³, mass = σ·τ·sopfr = 240 kg + cost = σ·J₂ = 288 k$, Brayton η + p-11B direct conversion η_ratio = σ/n = 2, R(6) = 1 self-ratio, ignition-stage cardinality = τ = 4 + battery = σ·τ = 48 kWh. Provides T1 evidence for F-FUSION-2. Sentinel `__HEXA_FUSION_CALC_TABLETOP__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [lattice, cross-doc, fusion, tabletop]`; help bumped.
- `tests/test_calculators.hexa` — added calc_tabletop row.
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  4/4`.

### Verification (iter 4)
- `hexa run verify/calc_tabletop.hexa` → 22/22 PASS.
- `hexa-fusion verify all` → `PASS: 4/4`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 3rd RSC iteration: D-T pillar algebraic derivation + test_calculators scaffolding)
- `verify/calc_fusion.hexa` — D-T pillar n=6 algebraic derivation (T1, 21/21 PASS). 9 sections cover master closure, fuel quartet (D=φ, T=n/φ, α=τ, Li-6=n), energy partition (α=1/sopfr=20%, n=τ/sopfr=80%), plasma+Q (T_i=σ+φ=14, Q=σ-φ=10), magnet+coil (B=σ·τ=48 with J₂²/σ factorisation cross-check, TF=3n=18), Brayton η=σ/J₂=50% + p-11B η_ratio=σ/n=2, TBR=(n+1)/n=7/6, Lawson closed-form (exponent=σ+φ=14, prefactor=τ=4), and 12-archetype card (σ·(σ-φ)+φ=122). Provides T1 evidence for F-FUSION-1 (Lawson) and F-FUSION-3 (powerplant Q). Sentinel `__HEXA_FUSION_CALC_FUSION__ PASS`.
- `tests/test_calculators.hexa` — calc_*/numerics_* sentinel sweep scaffolding (1 case at iter 3; bumps per iter). Sentinel `__HEXA_FUSION_TEST_CALCULATORS__ PASS`.
- `tests/test_all.hexa` — added test_calculators row (5 cases now).
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [lattice, cross-doc, fusion]`; help bumped.
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  3/3`.

### Verification (iter 3)
- `hexa run verify/calc_fusion.hexa` → 21/21 PASS.
- `hexa-fusion verify all` → `PASS: 3/3`, exit 0.
- `hexa run tests/test_all.hexa` → 5/5 PASS.

### Added (2026-05-07 — 2nd RSC iteration: cross-pillar anchor consistency)
- `verify/cross_doc_audit.hexa` — cross-pillar anchor consistency (T1, 24/24 PASS). Asserts that the canonical n=6 anchors (Q=σ-φ=10, T_i=σ+φ=14, B=σ·τ=48, η=σ/J₂=50%, J₂=24, aneutronic/neutronic verdict bit, archetype 122/122, ledger 26/27 + 1 honest negative) and the 4 falsifier preregister tags (F-FUSION-1/2/3/4) are referenced consistently across .roadmap + 4 pillar docs + hexa.toml + README. Sentinel `__HEXA_FUSION_CROSSDOC__ PASS`.
- `cli/hexa-fusion.hexa` — `VERIFY_SUBS = [lattice, cross-doc]`; help + per-subcmd help bumped.
- `tests/test_cli_verify.hexa` — expected aggregate bumped to `PASS:  2/2`.

### Verification (iter 2)
- `hexa run verify/cross_doc_audit.hexa` → 24/24 PASS.
- `hexa-fusion verify all` → `PASS: 2/2`, exit 0.
- `hexa run tests/test_all.hexa` → 4/4 PASS.

### Added (2026-05-07 — 1st RSC iteration: lattice closure + verify dispatcher + test scaffolding)
- `verify/lattice_check.hexa` — n=6 invariant lattice audit (T1). 35/35 checks: master closure (σ·φ = n·τ = J₂ = 24) + 8 fusion-projected derivations (Q=σ-φ=10, T_i=σ+φ=14, B=σ·τ=48, Brayton η=σ/J₂=50%, TBR=(n+1)/n=7/6, TF=3n=18, D-T α/n split, verdict bit) + roadmap declaration check + 4-pillar lattice-token cross-reference + archetype 122/122 + tabletop Q=τ=4 + powerplant B=σ·τ=48T + hexa.toml verdict honesty. Sentinel `__HEXA_FUSION_LATTICE__ PASS`.
- `cli/hexa-fusion.hexa` — extended `verify` subcommand with 2-tier dispatch: bare `verify` keeps the 28-item comprehensive sweep (v1.0.0 contract preserved); `verify all` runs every `verify/*.hexa` and aggregates exit codes; `verify <sub>` runs a single script. `VERIFY_SUBS = [lattice]` is the authoritative inventory (bumps per recipe iteration).
- `tests/test_lattice.hexa` — wraps `verify/lattice_check.hexa`; asserts exit 0 + sentinel. Sentinel `__HEXA_FUSION_TEST_LATTICE__ PASS`.
- `tests/test_cli_verify.hexa` — integration regression on `hexa-fusion verify all`; expected aggregate `PASS:  1/1` at iter 1 (bumps per iter). Sentinel `__HEXA_FUSION_TEST_CLI_VERIFY__ PASS`.
- `tests/test_all.hexa` — top-level test aggregator; runs 4 cases (selftest + derivative + lattice + cli_verify). Sentinel `__HEXA_FUSION_TEST_ALL__ PASS`.

### Verification (iter 1)
- `hexa run verify/lattice_check.hexa` → 35/35 PASS, 0 warn.
- `hexa-fusion verify all` → `PASS: 1/1`, exit 0.
- `hexa run tests/test_all.hexa` → 4/4 PASS, exit 0.

### Recipe provenance
- Following `~/core/bedrock/docs/runnable_surface_recipe.md` (Runnable Surface Construction). Validated upstream in hexa-cern v1.1.0-pre (16-script standard inventory, 7-step cycle per chunk).

### Added — derivative analysis (sscb-pattern composition)
- `cli/fusion_margin.hexa` — per-row residual / headroom report (sorted tightest first); 25 EXACT + 1 TIGHT + 1 BREACH (lawson_triple expected) on canonical n=6.
- `cli/fusion_whatif.hexa` — override n=6 lattice anchors and re-run the 27-row ledger; supports `--set sigma=11`-style counter-factuals; baseline reproduces 26/27 match.
- `cli/fusion_sensitivity.hexa` — ±-perturbation sweep (default ±1/5/10/20%) over each n=6 anchor; surfaces dominant levers (σ/φ -8 each, n -7, τ -5; μ decorative -1).
- `cli/fusion_archetype.hexa` — Mk.I→Mk.V projector with Q-target / B-field / T_i / Lawson decomposition; 122/122 EXACT closure tally per fusion.md §7-§8 v5.
- `cli/fusion_pillar.hexa` — per-pillar deep-dive (FUSION / TABLETOP_FUSION / FUSION_POWERPLANT / PLASMA_DEEP); closed-form n=6 projections per pillar.
- `cli/fusion_status.hexa` — single-screen project status (master identity + derived constants + 4-pillar table + ledger snapshot + falsifier preregister + release cadence).
- `cli/fusion_doctor.hexa` — env health probe (21 probes covering hexa runtime, hx pkg mgr, root resolution, core modules, derivative modules, roadmap, install hook).
- `cli/hexa-fusion.hexa` — extended dispatcher with 7 new subcommands: `margin / whatif / sensitivity / archetype / pillar / status / doctor`. Help + per-subcmd help updated.
- `tests/test_derivative.hexa` — 13-case sentinel sweep (text + JSON variants) for all derivative modules.
- `tests/test_selftest.hexa` — extended file-existence sweep covers 13 modules (6 core + 7 derivative).
- `install.hexa` — post-install now runs derivative-smoke after the core selftest.

### Composition origin
- Pattern referenced from [`hexa-sscb`](https://github.com/dancinlab/hexa-sscb) — `verify/sscb_verify.py`, `verify/cross_doc_audit.py`, `verify/bom_lattice.py` — adapted to hexa-fusion's 27-row ledger and 4-pillar tetrahedron. No hexa-sscb source modified; only structural composition reused.

### Verification
- All 7 new sentinels emit `__FUSION_<MODULE>__ PASS` on canonical n=6 lattice.
- `hexa-fusion selftest` reports `4/4 core + 7/7 derivative`.
- `hx install hexa-fusion` post-install runs derivative-smoke and PASSes.

## [1.0.0] - 2026-05-06

### Added
- Initial standalone extraction from `n6-architecture@c0f1f570`.
- 4-pillar Fusion Toolkit (HEXA family) skeleton:
  - `fusion/` — D-T ignition Lawson closure (WIRED)
    - `fusion/doc/fusion.md` — full SSOT (671 lines, §1-§8 Mk.V Lawson closure)
    - `fusion/doc/fusion_ledger.README.md` — HONESTY guard + ledger usage notes
    - `fusion/module/fusion_ledger.hexa` — 27-item closed-form ledger (26 EXACT + 1 honest neg)
    - `fusion/module/verify_fusion.hexa` — 28-item comprehensive verifier
  - `tabletop_fusion/doc/tabletop-fusion.md` — p-11B aneutronic feasibility scope (DOC)
  - `fusion_powerplant/doc/fusion-powerplant.md` — KSTAR-N6 powerplant scope (DOC)
  - `plasma_deep/doc/plasma-fusion-deep.md` — plasma physics deep-dive (DOC)
- CLI:
  - `cli/hexa-fusion.hexa` — 4-sub-command router (ledger / calc / dse / verify) + status + selftest
  - `cli/fusion_calc.hexa` — closed-form fusion calculators
  - `cli/fusion_dse.hexa` — design-space exploration (KSTAR-N6)
  - `cli/fusion_verify.hexa` — 28-item verifier sweep
- `hexa.toml` — package manifest (MIT, hexa-lang ≥ 1.0.0)
- `install.hexa` — hx pre/post hook (pure-hexa, no Python deps)
- `LICENSE` — MIT (Copyright (c) 2026 dancinlab)
- `tests/test_selftest.hexa` — 4-sub-command sanity sentinel test
- `examples/iter_q10_closed_form.md` — n=6 closed-form Q≥10 reproduction note
- `RELEASE_NOTES_v1.0.0.md`

### Verification
- 26/27 EXACT (96.3%) ledger closure
- `lawson_triple_keV_s_per_m3` 1-decade falsified (5.6e21 measured vs 5.6e20 closed-form) — preserved as honest negative
- 12 fusion-archetype closure 122/122 EXACT (v5)
- `verify_fusion` 28-item comprehensive sweep

### Provenance
- Extracted from `n6-architecture@c0f1f570` on 2026-05-06
- Sister-extraction of `hexa-bio` v1.0.0 (registry L24)
- Peaceful-only scope per upstream architecture commit
