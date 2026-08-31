---
paths:
  - "src/networking/**"
---

# Network Code Rules

- Follow the project's selected authority model; validate every untrusted peer or
  client input at its authority boundary
- All network messages must be versioned for forward/backward compatibility
- Use prediction, reconciliation, rollback, lockstep, or turn-based exchange only
  when required by the selected networking model
- Handle disconnection, reconnection, and host migration gracefully
- Rate-limit all network logging to prevent log flooding
- All networked values must specify replication strategy: reliable/unreliable, frequency, interpolation
- Bandwidth budget: define and track per-message-type bandwidth usage
- Security: validate all incoming packet sizes and field ranges
