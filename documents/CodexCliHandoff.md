# Train Only - Restart Handoff

## Current State

- Branch: `main`
- Check Git status for the live ahead/behind count before continuing; do not rely on
  a hard-coded count in this handoff.
- Recent committed milestones:
  - `complete database foundation`
  - `add Train Only direction north star`
  - `clarify Next Best Move business pressure guidance`
  - `refresh Train Only restart handoff`

Current checkpoint work may include:

- `.gitignore` repository-hygiene updates
- the verified `backend/` foundation
- `documents/SmartInquiry.md`, the canonical file referenced by the already-committed
  Smart Inquiry alignment

Always trust the live `git status` before staging. This checkpoint list records the work
area; it is not a permanent staging manifest and may become historical after later
commits.

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

- future-session obligation visibility
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

Accepted future direction:

- `SmartInquiry.md` defines a later trainer-owned path from existing interest to a
  structured inquiry inside Train Only. Exact surface, workflow, lifecycle, and data
  model remain validation decisions.
- It is not a lead marketplace, general trainer website or website builder, medical
  intake, or current build task. Manual workflow validation, authentication, public
  security, privacy, and AI fallback come before any public assistant.
- This direction does not change the current Stage 3 task or replace the Operations
  Briefing as the planned first agent workflow.

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

The uncommitted `backend/` folder contains the verified first Spring Boot foundation.

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

- IntelliJ's bundled Maven completed `clean verify` successfully.
- Six focused controller/service test executions passed.
- The packaged JAR is an executable Spring Boot JAR.
- Spring Boot started and stopped cleanly on port 8080.
- Spring supplied the managed database access successfully.
- The backend connected to local MySQL `train_only_db`.
- `GET /api/trainers/1/clients` returned HTTP 200 with Marcus Johnson followed by Alicia
  Taylor and the expected five response fields.
- The verification process stopped cleanly and released port 8080.
- No password is stored in tracked project files.

Current database-access direction:

- `ClientRepository` now uses Spring-managed `JdbcClient`, not raw `DriverManager`.
  The live application verified this pattern successfully; it is acceptable to copy in
  later small backend slices.
- Establish versioned database migrations before the next schema change. The active
  eight-table SQL foundation remains unchanged for now.

---

## Next Task

Do not start new features yet.

Next task:

**Finish repository/document hygiene and intentionally commit the verified backend
foundation without starting a new feature.**

Done means:

- `.gitignore` excludes local/build artifacts.
- Generated folders and local IDE settings stay out of git.
- Documents accurately record the completed backend gate and keep Smart Inquiry future.
- The final diff contains only intended backend, repository-hygiene, and document work.
- Backend and strategy/document changes are reviewed as intentional commit groups.
- Nothing is committed or pushed until Manley approves the exact staging commands.

After that commit, the next actual backend task is to translate the approved package
activation, session-consumption, package-overlap, and expiration-resolution rules into
backend contracts before package operations. Smart Inquiry remains future work.

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
workflow. The first backend foundation gate has already passed. Current goal:
finish repository/document hygiene, review the uncommitted diff, and prepare
intentional staging commands for approval. Do not repeat completed verification
unless relevant files changed, and do not start new features yet.
```
