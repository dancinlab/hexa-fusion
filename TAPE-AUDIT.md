# TAPE-AUDIT — hexa-fusion

## A. Audit-class ledgers

- `state/markers/*.marker` — **2123 markers** (`_probe_*`, `_t_*`, `_probe2/3/4_*` series — Lawson-triple falsifier probes for F-FUSION-1). Direct **Class-T** fit.
- `state/ITER_OPS_API.hexa` — **explicit T3 data-feed scaffold** for ITER plasma open-data. Header literally states "67% closure with T2 stack, remaining 33% closes when empirical D-T plasma data feed becomes available — that's T3." This is the **canonical measurement-pilot tape** target per theme spec.
- `state/KSTAR_PLASMA_LOG.hexa` — sibling log for KSTAR. Together these two `.hexa` data feeds = textbook tape-class-D + tape-class-T.

## B. Identity surface

`AGENTS.md` + `LIMIT_BREAKTHROUGH.md` + `KSTAR-N6.md` + `FUSION-POWERPLANT.md`. Two-instrument identity (ITER + KSTAR open-data feeds). Strong fit for `hexa-fusion/identity.tape` with `@I instrument=iter` + `@I instrument=kstar` declarations.

## C. Domain.md files

14 root MD files: FUSION, FUSION-POWERPLANT, KSTAR-N6, PLASMA-PHYSICS, SUPERCONDUCTOR, TABLETOP-FUSION, ... No `+`-meta-domains. KSTAR-N6 is the n6-tagged anchor.

## D. Per-run/per-event history

`_probe*` markers = Lawson-triple closed-form verification cycles. Two `.hexa` state files (`ITER_OPS_API`, `KSTAR_PLASMA_LOG`) are **already streaming data feeds** by intent — the format gap they fill is exactly what `.tape` was designed for. Migrating these to `state/iter.tape` + `state/kstar.tape` collapses bespoke `.hexa` scaffolds into the standard event grammar.

## E. Promotion candidates

- **n6 atoms** — Lawson criterion τ·n·T closed-form; D-T cross-section at 50keV (`bt-1169-1174-fusion-v5`). When F-FUSION-1 closes (currently 67%), Lawson triple becomes a verified n=6 law.
- **hxc binaries** — plasma diagnostic frames (ITER bolometer, KSTAR Thomson scattering). 
- **n12 cube cells** — confinement-type × fuel × scale (tokamak/stellarator/ICF × D-T/p-11B/D-D × tabletop/lab/reactor).

## Verdict

**HEAVY** — 2123 probe markers + two purpose-built `.hexa` data-feed scaffolds (ITER_OPS_API + KSTAR_PLASMA_LOG) that **already encode tape semantics by hand**. Strongest tape-migration ROI in this batch (the format gap is explicitly named in source).
