# Example — n=6 closed-form Q ≥ 10 reproduction (ITER-class)

> Reproduces the **Q = σ - φ = 10** energy-gain identity used by ITER as
> the Q-target benchmark (Q ≥ 10 fusion-energy / heating-energy ratio).
> Pure n=6 lattice arithmetic — no simulation, no Python, ~zero seconds.

## Setup

The n=6 invariant lattice provides:

```
σ(6) = 12        divisor sum (perfect number)
τ(6) =  4        divisor count
φ(6) =  2        minimum prime factor (number theory)
J₂   = 24        2σ — dual-restore invariant

Q := σ - φ = 12 - 2 = 10
```

This is the closed-form prediction asserted by `fusion/doc/fusion.md` §8
(Mk.V Lawson complete closure):

> | Q (energy-gain ratio) | Q = σ-φ = 10 | P_fus / P_heat = σ-φ | EXACT |

ITER's official Q-target is **Q = 10** (500 MW fusion / 50 MW heating).

## Reproduction (CLI)

```bash
# Recommended: run via the CLI router
hexa-fusion ledger | grep -i 'q.*=.*10\|sigma.*phi'

# Or directly invoke the fusion ledger module
hexa run fusion/module/fusion_ledger.hexa
```

Expected output (excerpt):

```
fusion_q          : Q = σ - φ = 12 - 2 = 10        EXACT
```

## Closed-form derivation

```
Q  =  P_fus / P_heat                                 (definition)
   =  σ - φ                                          (n=6 lattice, atlas Mk.V)
   =  12 - 2
   =  10                                             ✓ matches ITER target

Lawson triple (closed-form):
    nτT  =  τ · 10¹⁹ · (σ + φ)
         =  4 · 10¹⁹ · 14
         =  5.6 × 10²⁰  keV·s/m³                    (n=6 closed-form)

Empirical ignition threshold:  nτT ≥ 3 × 10²¹  keV·s/m³   (literature)
Measured (ITER projection):    nτT  ≈ 5.6 × 10²¹ keV·s/m³

Gap factor:  measured / closed-form  =  5.6e21 / 5.6e20  =  10×
```

## Honest negative

The 1-decade gap between the n=6 closed-form (5.6e20) and the measured
ITER projection (5.6e21) is recorded as the **only** falsified entry in
`fusion/module/fusion_ledger.hexa`:

```
lawson_triple_keV_s_per_m3  →  FALSIFIED (1-decade gap)
```

The HONESTY guard (see `fusion/doc/fusion_ledger.README.md` §HONESTY)
forbids silently inflating the closed-form by ×10 to "fix" the gap. The
gap IS the empirical signal, and is preserved on the falsified list at
all times.

26 / 27 ledger entries remain EXACT (96.3%). The Q = σ - φ = 10
identity is one of those 26 EXACT entries.

## Cross-link

- Full ledger source:        `fusion/module/fusion_ledger.hexa`
- Verifier sweep (28 items): `fusion/module/verify_fusion.hexa`
- HONESTY guard text:        `fusion/doc/fusion_ledger.README.md`
- Mk.V Lawson closure proof: `fusion/doc/fusion.md` §8
- 48T SC coil substrate:     <https://github.com/dancinlab/hexa-rtsc>
