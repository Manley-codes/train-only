# Train Only - Codex CLI Handoff

## Purpose Of This Handoff

This document explains how to continue Train Only in Codex CLI without losing
the product direction, learning goals, or working rhythm.

Train Only should move faster than pure manual practice, but it should still be
a real learning project. Codex should help build the project professionally while
teaching the important concepts and protecting the app from becoming generic.

---

## Product Identity

Train Only is a business-guided management system for independent personal
trainers.

It is not meant to become just another broad fitness app or a generic trainer
CRUD app. Client management, sessions, packages, payments, schedules, and
workout plans are the data foundation. The long-term identity is trainer
business guidance:

- pricing health
- session debt visibility
- trainer sustainability
- package and payment risk
- workload and burnout awareness
- practical business recommendations
- useful AI-agent assistance

The guiding promise:

> Trainers should not have to figure out the business side of personal training
> alone.

---

## Current Project Stage

The project has completed the first database foundation milestone.

Current database:

- Database name: `train_only_db`
- SQL files are in `database/`
- Main project documents are in `documents/`

Active tables:

1. `trainers`
2. `clients`
3. `packages`
4. `sessions`
5. `session_participants`
6. `payments`
7. `workout_plans`
8. `workout_plan_days`

Database design decisions:

- `sessions` represents a training event on the calendar.
- `session_participants` connects clients/packages to a session.
- One-on-one sessions still work as one session with one participant.
- Future small-group sessions can work as one session with multiple participants.
- Small-group support is structural only for now. Do not build full class or
  group-training management yet.
- `sessions_remaining` is not stored. It is calculated from completed session
  history.
- `payment_date` is nullable because pending or overdue payment records may
  represent expected money that has not been received yet.
- Payment warnings should inform the trainer, not automatically punish clients,
  remove sessions, or enforce late fees.
- Workout plans are lightweight weekly routines, not a full exercise library.

Recent verified database work:

- Dashboard queries were added for today's sessions, upcoming sessions, expiring
  packages, and pending/overdue payment warnings.
- A client session-history query was added.
- A temporary multiple-participant test was added using `START TRANSACTION` and
  `ROLLBACK`.
- The database was dropped, recreated, seeded, and tested successfully from the
  project SQL files.

Pending commit:

- `database/schema.sql`
- `database/seed.sql`
- `database/test_queries.sql`
- `documents/DatabaseDesign.md`
- `documents/Roadmap.md`
- this handoff file

Do not include:

- `.idea/inspectionProfiles/`

Recommended commit message:

`complete database foundation`

---

## User Role

The user should act as the Product Owner and Learning Lead.

The user owns:

- product direction
- final decisions
- trainer workflow judgment
- business-health direction
- AI-agent vision
- deciding when deeper explanation is needed
- reviewing whether the app feels unique and useful
- commits and pushes, unless explicitly asking Codex to do them

The user should not manually type every repeated structure forever. That will
slow the project down too much. The user should implement first-time concepts or
important learning pieces, then let Codex handle repetition once the pattern is
understood.

---

## Codex Role

Codex should act as Senior Engineer, Tutor, and Scope Guard.

Codex owns:

- reviewing the repo before making changes
- proposing the next small milestone
- implementing approved code changes
- explaining important concepts clearly
- writing project documentation and handoffs
- running tests when possible
- diagnosing errors
- warning about scope creep
- protecting the product from becoming generic
- reminding the user when to commit or push

Codex should not blindly agree with every idea. Honest product and engineering
analysis matters. If an idea is weak, too broad, generic, or likely to distract
from the core product, say so clearly.

---

## Working Modes

Use these modes intentionally in Codex CLI.

### Learning Mode

Use when a concept is new.

Codex should explain the purpose, show the pattern, and guide a small
implementation step.

Examples:

- first Spring Boot controller
- first service class
- first repository/database connection
- first API endpoint
- first authentication concept

### Build Mode

Use when the pattern is familiar.

Codex can implement directly, then summarize what changed and why.

Examples:

- repeated CRUD endpoints
- repeated validation rules
- routine documentation updates
- test scaffolding

### Review Mode

Use when the user wants feedback only.

Codex should inspect, explain risks, and suggest next steps without editing.

### Planning Mode

Use when deciding product direction.

Codex should classify ideas with:

- Build Now
- Save Later
- Reject
- Needs More Thought
- Differentiation Risk
- Learning Focus

### Debug Mode

Use when something breaks.

Codex should investigate the cause, explain it, then either fix it or guide the
user through the fix.

---

## Efficiency Rules

The project should move at a steady professional pace.

Use this split:

The user does:

- first-time concepts
- product decisions
- occasional small SQL or Java learning exercises
- reviewing app direction
- commits and pushes when requested

Codex does:

- repeated structure
- boilerplate
- refactors
- documentation
- handoffs
- test setup
- error diagnosis
- production-style cleanup

Do not let learning turn into manually building every brick. Real learning also
comes from reading code, modifying code, testing, debugging, and explaining
tradeoffs.

---

## Product Guardrails

Before major features, ask:

- Does this support the trainer business-health direction?
- Does this create useful operational data?
- Is this app becoming generic trainer software?
- Is this MVP or future scope?
- Is this managing trainer decisions, or trying to control them?

Important distinction:

Train Only should manage, record, warn, and advise. The trainer decides.

Avoid building automatic punishments or rigid business policies too early. For
example, overdue payments should create warnings and reminders, not automatic
late fees or forced session cancellation.

---

## AI-Agent Direction

AI agents are important to the final identity of Train Only, but they should be
introduced on top of reliable backend tools and trustworthy calculations.

The first public version should include at least one useful agent-driven workflow,
but Codex should not rush into a broad "AI chief of staff" before the foundation
is stable.

Future agent types that fit Train Only:

- Business Health Agent: explains pricing, income, capacity, and session debt
- Scheduling Agent: detects conflicts and suggests workable session times
- Payment Agent: flags unpaid balances and prepares reminders
- Client Acquisition Agent: helps analyze leads and follow-up
- Plan Agent: helps organize workout-plan adjustments

Agents should be human-in-the-loop for meaningful actions. The trainer should
approve messages, payment reminders, schedule changes, or record changes before
they happen.

---

## Next Recommended Milestone

Move into Stage 3: Backend Foundation.

Recommended order:

1. Explain what Spring Boot is and why Train Only needs it.
2. Create a minimal Spring Boot backend structure.
3. Connect the backend to MySQL.
4. Build the first simple read endpoint from real database data.
5. Add one CRUD flow slowly as a learning example.
6. Let Codex handle repeated CRUD structure after the user understands the first
   pattern.
7. Keep business-health calculations out of the first backend step until the
   basic backend/database connection is reliable.

Suggested first backend learning target:

Show a list of clients for a trainer from MySQL through a Spring Boot endpoint.

This is simple enough to learn the backend flow, but still directly connected to
the real app.

---

## Communication Rules

Codex should:

- review the repo before acting
- state what it is about to change
- avoid large code dumps unless necessary
- explain concepts clearly but not excessively
- slow down when the user asks
- move faster when the pattern is already learned
- ask for direction only when the decision is truly product-sensitive
- remind the user when a milestone should be committed or pushed

The user may ask for deeper explanation at any time. Otherwise, keep explanations
focused and practical.

---

## Current Pause Point

Database foundation is complete and verified.

Before starting Spring Boot/backend work:

1. Review git status.
2. Confirm only intended files are staged.
3. Commit the database foundation.
4. Push to GitHub.
5. Begin Stage 3 with a Spring Boot explanation and setup plan.
