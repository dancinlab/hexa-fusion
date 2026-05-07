# 🔥 hexa-fusion — Fusion Toolkit (HEXA family)

> 4-pillar fusion substrate organized around the **n=6 invariant lattice**:
> FUSION (D-T ignition) / TABLETOP_FUSION (p-11B aneutronic) /
> FUSION_POWERPLANT (KSTAR-N6) / PLASMA_DEEP. One pillar (`fusion`) is
> empirically wired with a **27-item closed-form ledger** (26 EXACT + 1
> honest negative) and a **28-item comprehensive verifier**; three pillars
> ship as scope-defining doc bundles at v1.0.0.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-informational.svg)](CHANGELOG.md)
[![Pillars: 1/4 wired](https://img.shields.io/badge/pillars-1%2F4_wired_(fusion)-blue.svg)]( #verification )
[![Ledger 26/27 EXACT](https://img.shields.io/badge/ledger-26%2F27_EXACT_(96.3%25)-brightgreen.svg)]( #verification )
[![n=6 lattice](https://img.shields.io/badge/n%3D6-σ%3D12_τ%3D4_φ%3D2_J₂%3D24-purple.svg)]( #why )
[![Honest negative](https://img.shields.io/badge/honest_negative-lawson__triple_1--decade-orange.svg)]( #verification )

> **Status (2026-05-06)**: initial standalone extraction from
> `n6-architecture@c0f1f570`. Sister-extraction of
> [`hexa-bio` v1.0.0](https://github.com/dancinlab/hexa-bio).

> **Distribution**: GitHub canonical at <https://github.com/dancinlab/hexa-fusion>.
> CLI tooling — installed via `hx install hexa-fusion` from the hexa-lang
> registry, or `git clone` directly.

---

## § Why

`hexa-fusion` is the **standalone Fusion Toolkit** of the HEXA family —
the empirical companion to `n6-architecture/domains/energy/fusion/` and
the canonical extraction-of-record for the 27-item D-T ignition ledger.

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

---

## § Verbs (4-pillar table)

| Pillar              | Status              | n=6 lattice                    | Empirical scope                                |
|---------------------|---------------------|--------------------------------|------------------------------------------------|
| `fusion`            | **WIRED v1.0.0**    | EXACT 26/27 + 1 honest neg.    | 27-item ledger + 28-item verify + Lawson closure |
| `tabletop_fusion`   | DOC v1.0.0          | inherited                      | p-11B aneutronic feasibility scope             |
| `fusion_powerplant` | DOC v1.0.0          | inherited                      | KSTAR-N6 powerplant design scope               |
| `plasma_deep`       | DOC v1.0.0          | inherited                      | plasma physics deep-dive notes                 |

CLI sub-commands wired at v1.0.0 (core):

| sub-command          | purpose                                              | source                       |
|----------------------|------------------------------------------------------|------------------------------|
| `hexa-fusion ledger` | 27-item D-T ignition ledger                          | `fusion/module/fusion_ledger.hexa` |
| `hexa-fusion calc`   | closed-form fusion calculators (Lawson / Q / Carnot) | `cli/fusion_calc.hexa`       |
| `hexa-fusion dse`    | design-space exploration (KSTAR-N6 powerplant scope) | `cli/fusion_dse.hexa`        |
| `hexa-fusion verify` | 28-item comprehensive verifier (bare); `verify all` runs every `verify/*.hexa`; `verify lattice` etc. | `cli/fusion_verify.hexa` + `verify/`  |

Derivative analysis (sscb-pattern composition; additive over core):

| sub-command                | purpose                                                              | source                            |
|----------------------------|----------------------------------------------------------------------|-----------------------------------|
| `hexa-fusion margin`       | per-row residual / headroom report (sorted tightest first)           | `cli/fusion_margin.hexa`          |
| `hexa-fusion whatif`       | override n=6 lattice → re-run 27-row ledger → diff matches           | `cli/fusion_whatif.hexa`          |
| `hexa-fusion sensitivity`  | ±-perturbation sweep over each n=6 anchor (dominance map)            | `cli/fusion_sensitivity.hexa`     |
| `hexa-fusion archetype`    | Mk.I→Mk.V projector + 122/122 EXACT closure tally                    | `cli/fusion_archetype.hexa`       |
| `hexa-fusion pillar`       | per-pillar deep-dive (4-pillar tetrahedron)                          | `cli/fusion_pillar.hexa`          |
| `hexa-fusion status`       | single-screen project status (pillars / ledger / falsifiers / cadence) | `cli/fusion_status.hexa`        |
| `hexa-fusion doctor`       | env health probe (runtime / modules / hx shim)                       | `cli/fusion_doctor.hexa`          |

The derivative modules follow the composition pattern from
[`hexa-sscb`](https://github.com/dancinlab/hexa-sscb)
(`verify/sscb_verify.py`, `verify/cross_doc_audit.py`, `verify/bom_lattice.py`)
— margin / whatif / sensitivity / mk-projection / doctor / status — applied
to hexa-fusion's 27-row D-T ignition ledger and 4-pillar tetrahedron.

Verdict: **PASS_WITH_HONEST_NEGATIVE** (1/4 pillars wired; 3/4 doc-only;
ledger 26/27 EXACT; archetype closure 122/122 EXACT v5).

---

## § Verification

**26/27 EXACT (96.3%), `lawson_triple_keV_s_per_m3` 1-decade falsified
(measured 5.6e21 vs n=6 closed-form 5.6e20) — preserved as honest
negative. `verify_fusion` 28-item comprehensive. 12 fusion-archetype
closure 122/122 EXACT (v5).**

The HONESTY guard (`fusion/doc/fusion_ledger.README.md` §HONESTY) MUST
keep the `lawson_triple_keV_s_per_m3` entry in the falsified list at
all times — the 1-decade gap is real and is the empirical signal that
the n=6 closed-form needs a calibration factor (×10) to match measured
ignition. No silent inflation is permitted.

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
| `hexa-fusion verify all`               | ✅ PASS | RSC inventory: 14 verify/*.hexa (T1 4 + T2 9 + META 1), aggregate 14/14 |
| `hx install hexa-fusion`               | ✅ PASS | post-install: selftest PASS + derivative smoke PASS |

---

## § Install

### Via `hx` (recommended)

```bash
hx install hexa-fusion          # global, pulls latest from registry
hx install hexa-fusion@1.0.0    # pin specific version
hexa-fusion --version           # → 1.0.0
```

### Via git clone (works today)

```bash
git clone https://github.com/dancinlab/hexa-fusion.git ~/.hexa-fusion
export HEXA_FUSION_ROOT=~/.hexa-fusion
export PATH="$HEXA_FUSION_ROOT/cli:$PATH"

# Run any subcommand:
hexa run $HEXA_FUSION_ROOT/cli/hexa-fusion.hexa selftest
hexa run $HEXA_FUSION_ROOT/cli/hexa-fusion.hexa ledger
hexa run $HEXA_FUSION_ROOT/cli/hexa-fusion.hexa verify
```

### Quick start

```bash
hexa-fusion selftest    # core + derivative sentinel sweep
hexa-fusion status      # single-screen project status (pillars/ledger/falsifiers/cadence)
hexa-fusion ledger      # 27-item D-T ignition ledger (26 EXACT + 1 honest neg)
hexa-fusion calc        # closed-form fusion calculators
hexa-fusion dse         # KSTAR-N6 design-space exploration
hexa-fusion verify      # 28-item comprehensive verifier

# derivative analysis (sscb-pattern composition):
hexa-fusion margin               # per-row residual/headroom (tightest first)
hexa-fusion margin --top 5       # only 5 tightest rows
hexa-fusion whatif               # baseline n=6 lattice re-run
hexa-fusion whatif --set lawson_calibration=10 --counter-factual
                                 # close the honest negative on paper
hexa-fusion sensitivity          # ±%-sweep dominance map
hexa-fusion archetype            # Mk.I→Mk.V projector
hexa-fusion archetype --mk mk5   # drill into a single Mk
hexa-fusion pillar               # 4-pillar deep-dive
hexa-fusion pillar --pillar fusion
hexa-fusion doctor               # env health probe
hexa-fusion doctor --strict      # treat WARN as FAIL
```

All subcommands accept `--json` for machine-parseable output.

---

## § Cross-link

| Repo                                                                      | Role                                            |
|---------------------------------------------------------------------------|-------------------------------------------------|
| [`dancinlab/hexa-rtsc`](https://github.com/dancinlab/hexa-rtsc) | RT-SC: 48T SC coil substrate (`σ·τ = 48`)       |
| [`dancinlab/hexa-bio`](https://github.com/dancinlab/hexa-bio)   | Sister Molecular Toolkit (HEXA family)          |
| Upstream concept SSOT                                                     | `n6-architecture/domains/energy/fusion/fusion.md` |
| Upstream architecture SHA                                                 | `n6-architecture@c0f1f570` (extraction commit)  |
| HEXA package registry                                                     | [`hexa-lang/tool/pkg/registry.tsv`](https://github.com/dancinlab/hexa-lang/blob/main/tool/pkg/registry.tsv) |

The `48T` superconducting coil identity (`σ(6) · τ(6) = 12 · 4 = 48`)
is the explicit substrate consumed by both `hexa-fusion` (as the
KSTAR-N6 powerplant magnetic backbone) and `hexa-rtsc` (as the
room-temperature SC primary deliverable).

---

## § License

MIT. See [LICENSE](LICENSE).

Author: 박민우 <nerve011235@gmail.com>
Copyright (c) 2026 dancinlab.

**Peaceful-only scope**: this toolkit is restricted to peaceful fusion
research per `n6-architecture@c0f1f570`. Weapons applications are
explicitly out-of-scope.
