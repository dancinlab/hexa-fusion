# Changelog

All notable changes to **hexa-fusion** are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and SemVer.

## [Unreleased]

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
