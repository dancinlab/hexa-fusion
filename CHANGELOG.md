# Changelog

All notable changes to **hexa-fusion** are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and SemVer.

## [Unreleased]

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
- Pattern referenced from [`hexa-sscb`](https://github.com/need-singularity/hexa-sscb) — `verify/sscb_verify.py`, `verify/cross_doc_audit.py`, `verify/bom_lattice.py` — adapted to hexa-fusion's 27-row ledger and 4-pillar tetrahedron. No hexa-sscb source modified; only structural composition reused.

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
- `LICENSE` — MIT (Copyright (c) 2026 need-singularity)
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
