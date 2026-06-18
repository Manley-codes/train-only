# SECTION 3 — ROADMAP

## Platform Plan

| Platform | Purpose | Technology |
|----------|---------|------------|
| Android (mobile) | Primary app for trainer + client | Java + Android Studio |
| Windows (desktop) | Full workstation view for trainer | Java + IntelliJ |
| iOS (future) | Expand client reach | TBD — connects to same backend |

---

## Technical Architecture
[ Android App ]         [ Desktop App ]
|                       |
└──────────┬────────────┘
|
[ Backend Server ]
Java + Spring Boot
|
[ MySQL Database ]

- **Front End** — Android and Desktop apps — what users see and interact with
- **Middle Layer** — Backend Server — handles business logic and security
- **Data Layer** — MySQL Database — stores everything permanently

When iOS is added later it connects to the same backend. No rebuilding the logic.

---

## Build Stages

Train Only follows a business-guided management strategy:

1. Build reliable operational records.
2. Turn those records into explainable business measures.
3. Recommend one useful Next Best Move.
4. Introduce useful agents early, after their calculations and tools are trustworthy.
5. Expand autonomy and multi-agent coordination gradually.

## Parallel Learning Track

- Main app foundation stays focused on database, backend, and core trainer workflows.
- AI agent learning can begin earlier in a separate agent-lab folder for experiments.
- Early agent experiments may include task spotlight, pricing advisor, scheduling assistant,
  and workout plan organizer using test data before production integration.

### Stage 1 — Blueprint
Status: In Progress

- [x] Define core app vision
- [x] Define key feature pillars
- [x] Design first database tables on paper
- [x] Set up GitHub repo and IntelliJ project structure
- [x] Create database folder with schema, seed, and test query files
- [ ] Sketch app screens (wireframes)

### Stage 2 — Database Foundation
Status: In Progress

- [x] Learn basic MySQL Workbench flow
- [x] Create train_only_db database
- [x] Create trainers table
- [x] Create clients table with trainer relationship
- [x] Create packages table with client relationship
- [x] Add initial seed data for trainer, client, and package
- [x] Add test queries for joined trainer, package, session, and payment data
- [x] Create sessions table
- [x] Add session participants table for future small-group support
- [x] Create payments table
- [x] Create workout plan tables
- [ ] Complete the client-package-payment-session workflow
- [ ] Add essential database safeguards
- [ ] Add trainer dashboard and client session-history queries
- [ ] Verify multiple participants without building class-management scope
- [ ] Recreate and verify the database from project SQL files

### Stage 3 — Backend Foundation
- Learn the purpose and structure of Spring Boot
- Set up the Java and Spring Boot backend
- Connect the backend to MySQL
- Implement core trainer, client, package, payment, and session operations
- Add validation, error handling, and authentication foundations
- Design backend actions as safe tools that future agents can call
- Research and select an agent framework/provider based on tool use, approvals, privacy,
  evaluation, cost, and Java/Spring Boot integration

### Stage 4 — Trainer Management MVP
- Refine the approved low-fidelity wireframes into working trainer screens
- Build the Android trainer experience
- Implement dashboard, client profile, scheduling, payments, and package transparency
- Keep workout plans lightweight
- Validate workflows with realistic trainer scenarios
- Test key workflows and early Business Health concepts with independent trainers
- Include at least one useful agent-driven workflow in the first public release
- Require trainer approval before the agent sends messages or changes business records

### Stage 5 — Trainer Business Health V1
- Add minimal trainer inputs: income goal and comfortable weekly capacity
- Calculate effective session rate
- Calculate future session obligation
- Calculate capacity pressure
- Calculate income goal gap
- Add basic facility-cost inputs when needed for realistic earnings scenarios
- Show explainable health states instead of an arbitrary overall score
- Generate one rule-based Next Best Move
- Validate thresholds, terminology, and recommendations with real trainers
- Add a Business Health Agent that explains results and prepares approved actions

### Stage 6 — Client Experience And Payments
- Add the client-facing experience
- Add secure one-time payments through a payment provider
- Add recurring payments only after the manual payment workflow is reliable
- Add package acknowledgment, reminders, and client transparency

### Stage 7 — Expanded Intelligence And AI
- Add marketing ROI and lead-conversion tracking
- Add recommendation history and business-plan updates
- Add market and location analysis only with trustworthy source data
- Add local affordability context using sourced median household income, geography,
  source dates, and clear limitations
- Add optional trainer operating modes and tailored full-time/side-gig dashboard
  priorities after the shared business foundation is stable
- Add side-gig capacity and client-acceptance scenarios after validation with trainers
- Add Business Runway detection and controlled pipeline-recovery workflows after
  facility costs, capacity, unpaid balances, and lead data are reliable
- Add AI-generated explanations after rule-based guidance is reliable
- Expand specialist-agent capabilities and controlled autonomy
- Add Chief-of-Staff-style coordination only after individual agents are reliable

| Agent | Responsibility |
|-------|----------------|
| Business Health Agent | Explains pricing, capacity, income, and future-session pressure |
| Scheduling Agent | Detects conflicts and suggests workable session times |
| Payment Agent | Flags unpaid balances and supports payment reminders |
| Client Acquisition Agent | Helps analyze leads, follow-up, and marketing performance |
| Plan Agent | Suggests workout plan adjustments based on client progress |

---

*This document will be updated as decisions are made. Version history tracked in GitHub.*
