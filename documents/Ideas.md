# Train Only
### Personal Trainer Management App
**Version:** 0.1 (Draft)
**Last Updated:** June 2026
**Status:** In Planning

---

## Overview

Train Only is a business-guided management system for independent personal trainers.
It combines reliable management of clients, packages, payments, sessions, schedules,
and lightweight workout plans with future guidance about pricing, workload, income
pressure, and business sustainability.

The management foundation creates trustworthy data. Business Health will later
use that data to explain risks and recommend one clear Next Best Move.

Android remains the primary planned application. A future desktop view and client-facing
experience will connect to the same Java and Spring Boot backend.

AI agents are part of the core product identity. The first public release should include
at least one useful agent-driven workflow, while more autonomous and coordinated agents
will be introduced only after their tools and approval rules are reliable.

The approved trainer-fit direction is documented in `TrainerBusinessFit.md`. It covers
full-time and part-time/side-gig personalization, realistic capacity, income goals,
facility costs, local affordability context, tailored dashboards, and the psychological
goal of reducing the trainer's mental load without becoming a life-management app.

---

# SECTION 1 — IDEAS

## The Two Users

### Trainer (Primary User)
The personal trainer who owns and manages the app. Has full access to all features.

### Client (Secondary User)
The trainer's client. Has a limited, read-focused view of their own data only.

---

## The Seven Core Problems

These pillars are derived from real problems experienced as a working personal trainer.

| # | Pillar | Core Problem It Solves |
|---|--------|------------------------|
| 1 | Scheduling & Notifications | Verbal agreements forgotten, sessions missed, no reliable alerts |
| 2 | Payment Management | No unified system, third-party blocks, chasing payments manually |
| 3 | Workout Plan Management | Plans scattered across notes apps, no per-client organization |
| 4 | Client Acquisition | Expensive ads, poor ROI, no guidance on outreach messaging |
| 5 | Session Transparency | Clients unaware of package terms and expiration rules |
| 6 | Session Tracking | Disputes over remaining sessions, no single source of truth |
| 7 | Trainer Sustainability | Trainers overwork, undercharge, and lack clear income targets |

---

## Future Ideas (Out of Scope For Now)

These are saved for future versions once the core app is complete.

- Client Progress Gallery (before/after photos and videos per client)
- In-app video workouts
- Wearable device integration
- Nutrition tracking
- Small-group training feature buildout. The database already supports the
  structure through `session_participants`; the full user-facing feature is later.
- Automated billing / charging clients
- iOS version (connects to same backend when ready)

---

## Open Questions

- [x] What is the app's name? **Train Only** ✓
- [ ] Will clients download the same app as trainers, or a separate app?
- [ ] What payment provider should the later Client Experience and Payments stage
  target? (Stripe is a candidate, not a final decision.)
- [ ] Should workout completions sync with the session tracker automatically?

---
