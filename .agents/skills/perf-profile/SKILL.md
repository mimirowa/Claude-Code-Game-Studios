---
name: perf-profile
description: "Measure and diagnose performance against project-configured budgets under representative and worst-case workloads."
---

# Performance Profile

Read technical preferences, Blueprint/Work Order budgets, target platforms, and
representative/worst-case scale. Define the question and baseline before
profiling. Record hardware/runtime/build, workload, warm-up, sample count, tools,
and commands. Measure first; identify dominant cost with evidence; change one
meaningful factor; measure again.

Report distributions where useful, budget comparison, bottleneck, confidence,
tradeoffs, and retained evidence. Do not impose universal allocation or millisecond
limits. Use `$sim-validate` for deterministic scenario/regression behavior and
route contract/budget changes back to Blueprint rather than hiding them in code.
