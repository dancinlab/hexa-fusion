# Changelog

All notable changes to **hexa-fusion** are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and SemVer.

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
