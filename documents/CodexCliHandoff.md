# Train Only - Restart Handoff

## Current State

- Branch: `main`
- Local branch is ahead of `origin/main` by 2 commits.
- Recent committed milestones:
  - `complete database foundation`
  - `add Train Only direction north star`
  - `clarify Next Best Move business pressure guidance`

Current uncommitted work expected:

- `.gitignore`
- `backend/`
- this restart handoff and related documentation cleanup

Do not include in commits:

- `.idea/inspectionProfiles/`
- generated build output such as `backend/target/`
- local dependency/cache folders such as `backend/.m2/`
- secrets, passwords, API keys, or real client information

The current project stage is **Stage 3: Backend Foundation**.

---

## Product Direction

Train Only is a business-guided management system for independent personal
trainers.

The management features are not the final identity by themselves. Clients,
packages, payments, sessions, schedules, and lightweight workout plans create the
reliable data foundation. The differentiator is the guidance built from that
data:

- session debt visibility
- pricing pressure
- package/payment risk
- trainer sustainability
- capacity and burnout awareness
- one clear Next Best Move
- future AI-agent assistance grounded in real backend tools

Business Health is the engine. Mentor-like guidance is the feel. The app should
advise from recorded facts and calculations, not throw generic motivational tips
or a wall of options at the trainer.

Train Only should manage, record, warn, and advise. The trainer decides.

---

## What Is Already Done

The database foundation is complete and committed.

Database name:

- `train_only_db`

Active tables:

1. `trainers`
2. `clients`
3. `packages`
4. `sessions`
5. `session_participants`
6. `payments`
7. `workout_plans`
8. `workout_plan_days`

Important database decisions:

- `sessions` represents the calendar/training event.
- `session_participants` connects clients and packages to a session.
- One-on-one training is one session with one participant.
- Small-group training is **structure now, feature later**.
- `sessions_remaining` is calculated from completed session history, not stored.
- `payment_date` can be blank for pending or overdue payment records.
- Payment warnings inform the trainer; they do not automatically punish clients,
  remove sessions, or enforce late fees.
- Workout plans are lightweight weekly routines, not a full exercise library.

The database was rebuilt and verified from the project SQL files.

---

## Where We Left Off

The uncommitted `backend/` folder contains an early Spring Boot scaffold.

Known backend shape:

- `TrainOnlyBackendApplication`
- `ClientController`
- `ClientService`
- `ClientRepository`
- `ClientSummary`
- `ClientDataAccessException`
- `ApiError`
- `GlobalExceptionHandler`

The first endpoint shape is:

```text
GET /api/trainers/{trainerId}/clients
```

What has been verified:

- The backend structure previously compiled through Maven.

What has not been fully verified:

- Spring Boot server starts cleanly.
- Spring context loads correctly.
- Backend connects to MySQL.
- `GET /api/trainers/1/clients` returns real seeded client data.

Important concern:

- `ClientRepository` currently uses raw `DriverManager` JDBC. Before committing
  the backend scaffold, decide whether to replace it with Spring-managed database
  access such as `DataSource` plus `JdbcClient` or `JdbcTemplate`. The first
  backend pattern matters because packages, sessions, payments, and dashboard
  endpoints will likely follow it.

---

## Next Task

Do not start new features yet.

Next task:

**Verify and clean up the Spring Boot backend foundation before committing it.**

Done means:

- `.gitignore` excludes local/build artifacts.
- Backend builds successfully.
- Spring Boot server starts.
- Database credentials are handled through local config or environment values,
  not committed secrets.
- Backend connects to local MySQL `train_only_db`.
- `GET /api/trainers/1/clients` returns the seeded clients.
- The repository/data-access pattern is acceptable to copy for the next backend
  features.
- Generated folders and local IDE settings stay out of git.

Recommended CLI prompt:

```text
Review the uncommitted backend scaffold and .gitignore. Do not commit yet.
Explain the current Spring Boot structure, verify the build, verify server
startup, verify MySQL connection, and test GET /api/trainers/1/clients. Recommend
whether to refactor ClientRepository from raw DriverManager to Spring-managed
DataSource + JdbcClient/JdbcTemplate before committing.
```

---

## How We Build From Here

Use a professional process, but keep it fitted to Train Only.

Before building:

- Check `git status`.
- Confirm the current milestone.
- State the task and why it matters for Train Only.
- Define what “done” means.

While building:

- Keep changes small.
- Explain new concepts when they first appear.
- Move faster on repeated patterns after the concept is understood.
- Avoid unrelated refactors.
- Do not let management features drift into a generic trainer app.

After building:

- Verify behavior, not just file changes.
- Summarize what changed and what remains unverified.
- Commit one clean milestone at a time.
- Push after meaningful checkpoints, especially before switching tools or chats.

Train Only check:

```text
Does this create reliable business data or support future Business Health guidance?
```

If not, the work may still be necessary, but it should be clearly treated as
foundation, not product identity.

Learning check:

- Slow down for first-time concepts like Spring Boot flow, dependency injection,
  database access, validation, authentication, and API design.
- Move faster once the pattern is familiar.
- Ask light knowledge-check questions when useful, but keep progress moving.

---

## Suggested New Chat Prompt

```text
Please review the repo first, especially documents/Direction.md,
documents/Roadmap.md, and documents/CodexCliHandoff.md. Check git status before
making changes. We are restarting Train Only in a cleaner, more professional
workflow. Current goal: verify and clean up the uncommitted Spring Boot backend
foundation before committing it. Do not start new features yet.
```
