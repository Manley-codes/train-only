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

### Stage 1 — Blueprint (Current)
- Define all features
- Design database tables on paper
- Sketch app screens (wireframes)
- Set up GitHub repo and IntelliJ project structure

### Stage 2 — Database Foundation
- Learn and set up MySQL
- Create core tables: Clients, Sessions, WorkoutPlans, Payments, Packages
- Practice CRUD operations (Create, Read, Update, Delete)

### Stage 3 — Android App (Core Trainer Features)
- Set up Android Studio
- Build trainer screens one at a time
- Connect screens to MySQL via Spring Boot backend

### Stage 4 — Client Side + Desktop View
- Add client-facing screens
- Build Java desktop version for trainers
- Learn separation of concerns — sharing logic across platforms

### Stage 5 — AI Agent Layer
- Introduce agents one at a time starting with Scheduling
- Build toward Chief of Staff Agent coordinating all sub-agents

| Agent | Responsibility |
|-------|----------------|
| Chief of Staff Agent | Coordinates all sub-agents, handles high-level requests |
| Scheduling Agent | Detects conflicts, suggests optimal session times |
| Payment Agent | Flags unpaid balances, sends reminders |
| Client Acquisition Agent | Drafts outreach messages, tracks prospect pipeline |
| Plan Agent | Suggests workout plan adjustments based on client progress |

---

*This document will be updated as decisions are made. Version history tracked in GitHub.*