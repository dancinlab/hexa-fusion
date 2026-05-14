<p align="center">
  <img src="docs/logo.svg" width="140" alt="hexa-fusion">
</p>

<h1 align="center">🔥 hexa-fusion</h1>

<p align="center"><strong>HEXA-Fusion family</strong> — fusion · plasma · 12 reactor closures · 122/122 EXACT</p>

<p align="center">
  <a href="LICENSE"><img alt="License" src="https://img.shields.io/badge/license-MIT-blue"></a>
  <a href="https://doi.org/10.5281/zenodo.20102608"><img alt="DOI" src="https://zenodo.org/badge/DOI/10.5281/zenodo.20102608.svg"></a>
  <img alt="Spec" src="https://img.shields.io/badge/spec-v1.0-success">
  <img alt="Closures" src="https://img.shields.io/badge/closures-122%2F122%20EXACT-informational">
  <img alt="Ledger" src="https://img.shields.io/badge/ledger-26%2F27%20EXACT-informational">
  <img alt="Verify" src="https://img.shields.io/badge/verify-23%2F23-informational">
  <a href="https://github.com/dancinlab/echoes"><img alt="Parent" src="https://img.shields.io/badge/parent-echoes-orange"></a>
  <img alt="Sibling" src="https://img.shields.io/badge/sibling-hexa--chip%20·%20hexa--mind%20·%20hexa--energy%20·%20hexa--rtsc%20·%20hexa--bio-blueviolet">
</p>

<p align="center">fusion · plasma · tokamak · KSTAR · tabletop · n=6 · σφτ · Mk.V</p>

---

`hexa-fusion` is the **standalone Fusion Toolkit** of the HEXA family — a 4-pillar fusion substrate organized around the **n=6 invariant lattice**: FUSION (D-T ignition) / TABLETOP_FUSION (p-11B aneutronic) / FUSION_POWERPLANT (KSTAR-N6) / PLASMA_DEEP. One pillar (`fusion`) is empirically wired with a **27-item closed-form ledger** (26 EXACT + 1 honest negative) and a **28-item comprehensive verifier**; three pillars ship as scope-defining doc bundles at v1.0.0. The 12-archetype reactor closure (Mk.I→Mk.V) lands **122/122 EXACT** under v5.

> [!NOTE]
> Member of the **HEXA family** under [`dancinlab/echoes`](https://github.com/dancinlab/echoes) (parent SSOT · LATTICE_POLICY). Siblings: [`hexa-chip`](https://github.com/dancinlab/hexa-chip) (semiconductor substrate), [`hexa-mind`](https://github.com/dancinlab/hexa-mind) (cognitive substrate), [`hexa-energy`](https://github.com/dancinlab/hexa-energy) (energy substrate), [`hexa-rtsc`](https://github.com/dancinlab/hexa-rtsc) (room-temperature superconductor — 48T SC coil sibling), [`hexa-bio`](https://github.com/dancinlab/hexa-bio) (molecular toolkit). Canonical extraction-of-record for the 27-item D-T ignition ledger from `canon@c0f1f570`.

## Why

The 4 pillars form a **tetrahedron** organized around the n=6 invariant lattice:

```
                         ┌──────────────┐
                         │  D-T ignition│
                         │   (FUSION)   │
                         └───────┬──────┘
                                 │
                 ┌───────────────┼───────────────┐
                 │               │               │
       ┌─────────▼────────┐  ┌───▼─────────┐  ┌─▼──────────┐
       │ p-11B aneutronic │  │  KSTAR-N6   │  │ plasma deep│
       │ (TABLETOP_FUSION)│  │(POWERPLANT) │  │  (PLASMA_  │
       │      [DOC]       │  │    [DOC]    │  │   DEEP)    │
       └──────────────────┘  └─────────────┘  │   [DOC]    │
                                              └────────────┘
```

The lattice anchors the toolkit to a single algebraic identity:

```
σ(6) = 12        divisor sum (perfect number)
τ(6) = 4         divisor count
φ(6) = 2         minimum prime factor (number theory)
J₂   = 24        2σ — dual-restore invariant

master identity:   σ · φ = n · τ = 12 · 2 = 6 · 4 = 24
Q                = σ - φ = 10                  (energy gain ratio)
SC coil          = σ · τ = 48                  (T)
```

The **D-T Lawson triple closed-form** is:

```
nτT = τ · 10¹⁹ · (σ + φ) = 4 · 10¹⁹ · 14 = 5.6 × 10²⁰  (n=6 closed-form)
```

against the empirical ignition criterion `nτT ≥ 3 × 10²¹ keV·s/m³`. The
1-decade gap between closed-form and measured (5.6e21) is preserved as an
**honest negative** — see § Verification.

## Status

- **v1.0.0** initial standalone extraction from `canon@c0f1f570` (2026-05-06). Sister-extraction of [`hexa-bio` v1.0.0](https://github.com/dancinlab/hexa-bio).
- **Pillars**: 1/4 wired (FUSION) + 3 DOC (TABLETOP_FUSION / FUSION_POWERPLANT / PLASMA_DEEP).
- **Ledger**: 26/27 EXACT (96.3%) — `lawson_triple_keV_s_per_m3` 1-decade falsified, preserved as honest negative.
- **Archetype closure**: 12 archetype × 10 sub-section + LIMITS 2 = **122/122 EXACT** (v5, Mk.I→Mk.V monotone).
- **Verifier**: `verify_fusion` 28-item comprehensive sweep · `verify/run_all.hexa` orchestrator 23/23 PASS.
- **Distribution**: GitHub canonical at <https://github.com/dancinlab/hexa-fusion>; CLI tooling via `hx install hexa-fusion` from the hexa-lang package registry.

> [!IMPORTANT]
> **Peaceful-only scope**: this toolkit is restricted to peaceful fusion research per `canon@c0f1f570`. Weapons applications are explicitly out-of-scope. The HONESTY guard (`fusion/doc/fusion_ledger.README.md` §HONESTY) MUST keep the `lawson_triple_keV_s_per_m3` entry in the falsified list at all times — the 1-decade gap is real and is the empirical signal that the n=6 closed-form needs a calibration factor (×10) to match measured ignition. No silent inflation is permitted.

## Verification

**26/27 EXACT (96.3%), `lawson_triple_keV_s_per_m3` 1-decade falsified
(measured 5.6e21 vs n=6 closed-form 5.6e20) — preserved as honest
negative. `verify_fusion` 28-item comprehensive. 12 fusion-archetype
closure 122/122 EXACT (v5).**

Archetype closure detail: see `fusion/doc/fusion.md` §7 / §8 (Mk.V Lawson
complete closure, 12 archetype × 10 sub-section + LIMITS 2 = 122 fields,
all EXACT under v5).

Verifier sweep detail: see `fusion/module/verify_fusion.hexa` (28 items
covering Carnot, Lawson, Q, SC coil, plasma identities, ledger sanity).

### Last validation sweep

| Check                                  | Result | Notes |
|----------------------------------------|--------|-------|
| `hexa-fusion selftest`                 | ✅ PASS | 4/4 core + 7/7 derivative sentinels present |
| `hexa-fusion margin`                   | ✅ PASS | 25 EXACT + 1 TIGHT (energy_confinement 0.4%) + 1 BREACH (lawson_triple, expected) |
| `hexa-fusion whatif`                   | ✅ PASS | baseline reproduces 26/27; `--set lawson_calibration=10` closes honest negative on paper |
| `hexa-fusion sensitivity`              | ✅ PASS | dominant levers σ/φ (-8 each), n (-7), τ (-5); μ decorative (-1) |
| `hexa-fusion archetype`                | ✅ PASS | Mk.I→Mk.V monotone; 122/122 EXACT closure (v5) |
| `hexa-fusion pillar`                   | ✅ PASS | 4 pillars project closed-form; FUSION wired, 3 DOC |
| `hexa-fusion status`                   | ✅ PASS | identity preserved; 26/27 ledger; 4 falsifier registry |
| `hexa-fusion doctor`                   | ✅ PASS | 21/21 OK probes (no MISS, no WARN) |
| `hexa run tests/test_selftest.hexa`    | ✅ PASS | 13/13 modules present (core + derivative) |
| `hexa run tests/test_derivative.hexa`  | ✅ PASS | 13/13 sentinel sweep (text + JSON variants) |
| `hexa run tests/test_lattice.hexa`     | ✅ PASS | wraps `verify/lattice_check.hexa` (35/35 n=6 invariants) |
| `hexa run tests/test_cli_verify.hexa`  | ✅ PASS | `hexa-fusion verify all` aggregates `1/1` PASS (iter 1) |
| `hexa run tests/test_all.hexa`         | ✅ PASS | top-level aggregator: 4/4 tests green |
| `hexa run tests/test_calculators.hexa` | ✅ PASS | calc_*/numerics_* sentinel sweep (11 cases) |
| `hexa-fusion verify falsifier`         | ✅ PASS | F-FUSION-1/2/3/4 all at 67% closure (T1+T2 locked, T3 TBD) |
| `hexa-fusion verify lint-numerics`     | ✅ PASS | 9 numerics_*.hexa scripts × 5 invariants = 46/46 conform |
| `hexa-fusion verify all`               | ✅ PASS | RSC inventory: 15 verify/*.hexa (T1 4 + T2 9 + META 2), aggregate 15/15 |
| `hexa run verify/run_all.hexa`         | ✅ PASS | orchestrator sweep: **23/23 verify/*.hexa scripts** (T1×2 + T2×12 + T3×4 + meta×5) — bookkeeping closure only, sister of `hexa-rtsc` run_all |
| `make -C build check`                  | ✅ PASS | pandoc + xelatex + hexa toolchain ready (build/Makefile) |
| `make -C build all`                    | ✅ PASS | 4 pillar PDFs rebuilt (fusion / tabletop / powerplant / plasma) |
| `hx install hexa-fusion`               | ✅ PASS | post-install: selftest PASS + derivative smoke PASS |

## Install

```sh
# 1. Install hexa-lang (gives you `hexa` + `hx` package manager)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dancinlab/hexa-lang/main/install.sh)"

# 2. Install hexa-fusion
hx install hexa-fusion
```

## Run

```sh
hexa-fusion ledger          # 27-item D-T ignition ledger (26 EXACT + 1 honest negative)
hexa-fusion calc            # closed-form fusion calculators (Lawson / Q / Carnot)
hexa-fusion dse             # design-space exploration (KSTAR-N6 powerplant scope)
hexa-fusion verify          # 28-item comprehensive verifier sweep
hexa-fusion margin          # per-row residual / headroom report (tightest first)
hexa-fusion whatif          # override n=6 lattice, re-run ledger, diff matches
hexa-fusion sensitivity     # ±perturbation sweep over n=6 anchors (dominance map)
hexa-fusion archetype       # Mk.I→Mk.V projector + 122/122 EXACT closure tally
hexa-fusion pillar          # per-pillar deep-dive (4-pillar tetrahedron)
hexa-fusion status          # single-screen project status (pillars/ledger/falsifiers/cadence)
hexa-fusion doctor          # env health probe (runtime, modules, hx shim)
hexa-fusion selftest        # sub-command sentinel sweep (core + derivative)

# Orchestrator (sister of hexa-rtsc verify/run_all.hexa)
hexa run verify/run_all.hexa  # aggregate sweep — 23/23 verify/*.hexa (bookkeeping closure)
```

### Optional deps

`hexa-fusion` is **pure hexa-lang stdlib** — zero Python deps, zero external.
All default subcommands run with `hx install hexa-fusion` alone. Cross-substrate
extras (e.g. `qmirror` for ANU-QRNG + Aer state-vector simulator) are
auto-resolved by `hx install` when declared in `hexa.toml`.

## Repo layout

```
hexa-fusion/
├── README.md                       this file (18-block atlas/README-FORMAT.md)
├── LICENSE                         MIT
├── AGENTS.tape                     governance + identity (.tape v1.2)
├── CLAUDE.md                       symlink → AGENTS.tape
├── CHANGELOG.md                    change log
├── CITATION.cff                    citation metadata
├── RELEASE_NOTES_v1.0.0.md         v1.0.0 release notes
├── IMPORTED_FROM_CANON.md          extraction provenance (canon@c0f1f570)
├── LATTICE_POLICY.md               project-local copy of echoes real-limits standard
├── LIMIT_BREAKTHROUGH.md           HARD/SOFT_WALL · BREAKABLE_WITH_TECH · UNCLEAR audit
├── TAPE-AUDIT.md                   .tape v1.x adoption audit ledger
├── FUSION.md                       pillar 1 doc — D-T ignition
├── FUSION.tape                     pillar 1 domain ledger (.tape)
├── IDENTITY.tape                   identity claim (.tape v1.x)
├── TABLETOP-FUSION.md              pillar 2 doc — p-11B aneutronic
├── FUSION-POWERPLANT.md            pillar 3 doc — KSTAR-N6
├── KSTAR-N6.md                     KSTAR-N6 specifics
├── PLASMA-PHYSICS.md               pillar 4 doc — plasma deep
├── SUPERCONDUCTOR.md               48T SC coil sibling (→ hexa-rtsc)
├── hexa.toml                       TOML config
├── install.hexa                    install entry
├── cli/                            11 CLI subcommands
├── fusion/                         pillar 1 module + doc
├── tabletop_fusion/                pillar 2 scope bundle
├── fusion_powerplant/              pillar 3 scope bundle
├── plasma_deep/                    pillar 4 scope bundle
├── verify/                         25 verification scripts (T1/T2/T3/meta)
├── tests/                          7 hexa test modules
├── examples/                       example usage
├── papers/                         publications
├── breakthroughs/                  breakthrough log
├── origins/                        provenance trail
├── docs/                           logo + supplementary docs
├── build/                          PDF build artifacts (Makefile)
└── state/                          runtime state (gitignored typically)
```

## Cross-link

| Repo                                                                      | Role                                            |
|---------------------------------------------------------------------------|-------------------------------------------------|
| [`dancinlab/hexa-rtsc`](https://github.com/dancinlab/hexa-rtsc) | RT-SC: 48T SC coil substrate (`σ·τ = 48`)       |
| [`dancinlab/hexa-bio`](https://github.com/dancinlab/hexa-bio)   | Sister Molecular Toolkit (HEXA family)          |
| [`dancinlab/echoes`](https://github.com/dancinlab/echoes)       | Parent SSOT · LATTICE_POLICY                    |
| Upstream concept SSOT                                                     | `canon/domains/energy/fusion/fusion.md` |
| Upstream architecture SHA                                                 | `canon@c0f1f570` (extraction commit)  |
| HEXA package registry                                                     | [`hexa-lang/tool/pkg/registry.tsv`](https://github.com/dancinlab/hexa-lang/blob/main/tool/pkg/registry.tsv) |

The `48T` superconducting coil identity (`σ(6) · τ(6) = 12 · 4 = 48`)
is the explicit substrate consumed by both `hexa-fusion` (as the
KSTAR-N6 powerplant magnetic backbone) and `hexa-rtsc` (as the
room-temperature SC primary deliverable).

## License

[MIT](LICENSE) — permissive open-source. See [LICENSE](LICENSE) for full terms.

Author: 박민우 <nerve011235@gmail.com>
Copyright (c) 2026 dancinlab.

**Peaceful-only scope**: this toolkit is restricted to peaceful fusion
research per `canon@c0f1f570`. Weapons applications are
explicitly out-of-scope.
