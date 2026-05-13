#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# hexa-fusion — IDENTITY (Fusion Toolkit, n=6 lattice)
# ══════════════════════════════════════════════════════════════

@I birth hexa_fusion :: identity [d=2026-05-14 ok]
  kind = "Fusion Toolkit · D-T ignition + p-11B aneutronic + KSTAR-N6 powerplant + plasma deep · n=6 invariant lattice (σ=12, τ=4, φ=2, J₂=24)"
  => "Lawson-probe measurement pilots + hand-encoded ITER_OPS_API + KSTAR_PLASMA_LOG already in tape semantics — strongest .tape adoption ROI in physical substrate"

@I scope :: identity [d=2026-05-14 ok]
  <- hexa_fusion
  capabilities = ["plasma-probe","ignite-D-T","aneutronic-p-11B","kstar-n6-powerplant","lattice-verify"]
  refuses = ["fit-to-convenient-number"]

@I origin :: identity [d=2026-05-14 ok]
  <- hexa_fusion
  repo = "github.com/dancinlab/hexa-fusion"
  ssot = "~/core/hexa-fusion/"
  hand_encoded_tape_semantics = ["state/ITER_OPS_API.hexa","state/KSTAR_PLASMA_LOG.hexa"]

@I principle :: identity [d=2026-05-14 ok]
  <- hexa_fusion
  principles = ["lattice-as-tool","lawson-criterion-empirical","aneutronic-preferred-where-feasible"]
  ssot = "LATTICE_POLICY.md (sibling of hexa-chip)"

@I version :: identity [d=2026-05-14 ok]
  <- hexa_fusion
  marker_count_approx = 2123
  domain_count_approx = 20
  hand_encoded_data_feeds = 2
