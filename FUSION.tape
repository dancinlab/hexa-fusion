#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# FUSION.tape — domain history (Lawson probes + plant milestones)
#
# Hand-encoded data feeds (ITER_OPS_API.hexa, KSTAR_PLASMA_LOG.hexa)
# remain as `.hexa` SSOT for performance reasons (they encode tape
# semantics inline). This tape is the cross-feed milestone projection.
# ══════════════════════════════════════════════════════════════

@D c1 := "fusion.lattice_invariant_n6" :: fusion [d=2026-05-14 ok]
  text = "n=6 invariant lattice (σ=12, τ=4, φ=2, J₂=24) applied to fusion substrate"
  proof = "LATTICE_POLICY.md §3.1 격자-네이티브"

@D c2 := "fusion.dt_ignition_target" :: fusion [d=2026-05-14 ok]
  text = "D-T ignition Lawson criterion as empirical anchor"
  proof = "state/markers/ Lawson-probe series (~2123 markers)"

@D c3 := "fusion.iter_ops_api_hand_encoded" :: fusion [d=2026-05-14 ok]
  text = "state/ITER_OPS_API.hexa hand-encodes tape semantics inline (preserve as .hexa for runtime perf)"
  proof = "state/ITER_OPS_API.hexa"

@A milestone_kstar_n6_powerplant :: fusion [d=2026-04-15 ok]
  <- c1, c2
  => "KSTAR-N6 powerplant design milestone — n=6 lattice applied to plasma confinement"

@A milestone_plasma_deep :: fusion [d=2026-05-01 ok]
  <- milestone_kstar_n6_powerplant
  => "plasma-deep verb subtree lands — covers plasma physics + numerical solvers + ITER comparison"

@A milestone_aneutronic_p_11b :: fusion [d=2026-05-10 ok]
  <- milestone_plasma_deep
  => "p-11B aneutronic path — cleanest fusion reaction, hardest cross-section; substrate added as v1 verb"
