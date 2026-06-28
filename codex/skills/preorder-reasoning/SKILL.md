---
name: preorder-reasoning
description: Idris and Idris2 preorder/equational reasoning syntax guidance. Use when working with Syntax.PreorderReasoning, Syntax.PreorderReasoning.Generic, Calc, CalcWith, |~, ~~, <~, ..., ..<, ..>, .=., .=<, .=>, ~=, equality chains, LTE chains, preorder proofs, or Idris relation reasoning APIs.
---

# Preorder Reasoning

Use this skill to explain or apply Idris2's preorder reasoning syntax. Prefer checking the locally installed Idris library source when exact module names matter, because module names can differ across Idris versions.

## Module Choice

Use `Syntax.PreorderReasoning` for pure equality chains. It proves `x ~=~ y`/equality-style results from a sequence of equality steps.

Use `Syntax.PreorderReasoning.Generic` for arbitrary preorder chains, such as `LTE`, custom relations, or a mix of relation steps and equality rewrites. In Idris2 0.8.0, the installed general preorder module is named `Syntax.PreorderReasoning.Generic`; do not assume `Syntax.PreorderReasoning.General` exists without checking the local install.

## Equality Chains

Import:

```idris
import Syntax.PreorderReasoning
```

Pattern:

```idris
proof =
  Calc $
    |~ start
    ~~ next ...(eqProof)
    ~~ final ...(eqProof2)
```

Read `y ...(prf)` as "the next expression is `y`, justified by `prf`."

Useful equality operators:

- `|~ x`: start a calculation at `x`
- `~~ y ...(prf)`: move to `y` using an equality proof
- `Calc $ der`: extract the final equality proof
- `y ..<(prf)`: reverse an equality step by using `sym prf`
- `y ..>(prf)`: explicit forward equality step
- `der ~= z`: append a judgemental equality step when Idris can solve `current = z`

Example:

```idris
example : (x : Nat) -> (x + 1) + 0 = 1 + x
example x =
  Calc $
    |~ (x + 1) + 0
    ~~ x + 1 ...(plusZeroRightNeutral (x + 1))
    ~~ 1 + x ...(plusCommutative x 1)
```

## Generic Preorder Chains

Import:

```idris
import Syntax.PreorderReasoning.Generic
```

Pattern:

```idris
proof =
  CalcWith {leq = REL} $
    |~ start
    <~ next ...(relProof)
    ~~ rewritten ...(eqProof)
    <~ final ...(relProof2)
```

`CalcWith {leq = REL}` requires a `Preorder dom REL` instance. It returns a proof of `REL start final`.

Useful generic operators:

- `|~ x`: start a derivation at `x`
- `<~ y ...(prf)`: move to `y` using a relation proof, where `prf : REL current y`
- `~~ y ...(eq)`: rewrite the current expression by equality inside the relation chain
- `CalcWith {leq = REL} $ der`: extract the final preorder proof
- `CalcSmart der`: lower-level extractor; needs only the exact prerequisite, such as reflexivity or transitivity
- `y ..<(prf)`: reverse a step when a `Symmetric` instance is available
- `y ..>(prf)`: explicit forward relation step
- `y .=.(Refl)`, `y .=<(Refl)`, `y .=>(Refl)`: convert definitional equality into a reflexive relation step
- `der ~= z`: append a judgemental equality rewrite

Example over natural-number `LTE`:

```idris
lteExample : LTE 1 3
lteExample =
  CalcWith {leq = LTE} $
    |~ 1
    <~ 2 ...(LTESucc LTEZero)
    <~ 3 ...(LTESucc (LTESucc LTEZero))
```

## Local Verification

When uncertain, inspect the installed library:

```bash
idris2 --libdir
```

Then read:

- `base-*/Syntax/PreorderReasoning.idr`
- `base-*/Syntax/PreorderReasoning/Generic.idr`
- `base-*/Syntax/PreorderReasoning/Ops.idr`

Use `:browse` or source inspection to confirm exported names before giving version-sensitive advice.
