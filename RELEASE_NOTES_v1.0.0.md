# hexa-fusion v1.0.0 — Fusion Toolkit (HEXA family)

**Release date**: 2026-05-06
**Closure verdict**: **PASS_WITH_HONEST_NEGATIVE** (26/27 EXACT + 1
falsified entry preserved per HONESTY guard; 1/4 pillars wired; 3/4
doc-only)
**Provenance**: extracted 2026-05-06 from `n6-architecture@c0f1f570`.
Sister-extraction of `hexa-bio` v1.0.0 (registry L24).

This is the **initial standalone release** of `hexa-fusion`, a 4-pillar
fusion substrate organized around the **n=6 invariant lattice**: FUSION
(D-T ignition, WIRED) / TABLETOP_FUSION (p-11B aneutronic, DOC) /
FUSION_POWERPLANT (KSTAR-N6, DOC) / PLASMA_DEEP (DOC).

## Highlights

- **4-pillar tetrahedron** — FUSION (D-T ignition Lawson closure, WIRED),
  TABLETOP_FUSION (p-11B aneutronic, DOC), FUSION_POWERPLANT (KSTAR-N6,
  DOC), PLASMA_DEEP (DOC).
- **27-item D-T ignition ledger** (`fusion/module/fusion_ledger.hexa`):
  26 EXACT entries + 1 honest negative (`lawson_triple_keV_s_per_m3`
  1-decade falsified, measured 5.6e21 vs n=6 closed-form 5.6e20 —
  preserved per HONESTY guard).
- **28-item comprehensive verifier** (`fusion/module/verify_fusion.hexa`):
  Carnot / Lawson / Q / SC coil / plasma identities + ledger sanity.
- **12 fusion-archetype closure** — 122/122 EXACT (v5) per
  `fusion/doc/fusion.md` §7-§8 Mk.V Lawson complete closure.
- **n=6 invariant lattice** — `σ(6)=12, τ(6)=4, φ(6)=2, J₂=24`; master
  identity `σ·φ = n·τ = 24`; Q = σ-φ = 10; SC coil = σ·τ = 48 T.
- **CLI** — 6 sub-commands (`ledger`, `calc`, `dse`, `verify`, `status`,
  `selftest`); every sub-command accepts `--version` and `--json`.
- **MIT** license; **zero Python deps** at v1.0.0 (pure hexa-lang
  closed-form arithmetic).
- **GitHub-only distribution** — canonical at
  <https://github.com/need-singularity/hexa-fusion>.

## Installation

```bash
# Recommended (post-hx install registration):
hx install hexa-fusion@1.0.0
hexa-fusion --version           # → 1.0.0

# Or git clone (works today):
git clone https://github.com/need-singularity/hexa-fusion.git ~/.hexa-fusion
export HEXA_FUSION_ROOT=~/.hexa-fusion
export PATH="$HEXA_FUSION_ROOT/cli:$PATH"
hexa-fusion selftest
```

## Quickstart

```bash
hexa-fusion selftest    # 4-sub-command sentinel sweep
hexa-fusion status      # 4-pillar status table + caveats
hexa-fusion ledger      # 27-item D-T ignition ledger (26 EXACT + 1 honest neg)
hexa-fusion calc        # closed-form fusion calculators
hexa-fusion dse         # KSTAR-N6 design-space exploration
hexa-fusion verify      # 28-item comprehensive verifier
```

## Honest C3 caveats (raw#10)

1. **3/4 pillars are doc-only at v1.0.0.** `tabletop_fusion`,
   `fusion_powerplant`, and `plasma_deep` ship as scope-defining doc
   bundles; numerical sandboxes are deferred.
2. **lawson_triple is 1-decade falsified.** The HONESTY guard MUST keep
   `lawson_triple_keV_s_per_m3` in the falsified list (measured 5.6e21
   vs n=6 closed-form 5.6e20). No silent inflation — the gap is the
   empirical signal that the closed-form needs a ×10 calibration factor.
2. **n=6 invariant lattice claim is empirically grounded only for
   `fusion`.** The other 3 pillars inherit the lattice claim by
   hypothesis.
4. **Peaceful-only scope.** Weapons applications are explicitly
   out-of-scope per `n6-architecture@c0f1f570`.
5. **Public-repo maintenance burden** — issue/PR triage cost is on the
   author; downstream consumers should not assume future SLA.

## Cross-link

- Sister substrate: [`need-singularity/hexa-rtsc`](https://github.com/need-singularity/hexa-rtsc)
  — RT-SC: 48T SC coil substrate (`σ·τ = 48`)
- Sister extraction: [`need-singularity/hexa-bio` v1.0.0](https://github.com/need-singularity/hexa-bio)
  — Molecular Toolkit (HEXA family)
- Upstream concept SSOT: `n6-architecture/domains/energy/fusion/fusion.md`
- Upstream architecture SHA: `n6-architecture@c0f1f570`

## License

MIT — see [LICENSE](LICENSE).

Copyright (c) 2026 need-singularity (박민우 <nerve011235@gmail.com>).
