# Train Only Product Strategy
**Version:** 0.2
**Last Updated:** July 2026
**Status:** Working product direction

---

## Product Thesis

Train Only is a business-guided management system for independent personal trainers.

The management tools create trustworthy operational data. Business Health
turns that data into clear, explainable guidance.

The product promise is:

> You do not have to figure out the business side of personal training alone.

Train Only should help a trainer answer:

- What condition is my business in?
- What is creating the most pressure?
- What should I focus on next?
- Can I fulfill what I have sold without undercharging or overworking?

---

## AI Agent Product Role

AI agents are a core part of Train Only's intended product identity, not a decorative
feature to add after the rest of the application is complete.

The first public release should include at least one useful agent-driven workflow.
However, agents should be introduced only after the underlying data, calculations, and
application actions they depend on are reliable.

The intended progression is:

1. Build trustworthy records, business rules, and backend actions.
2. Give a focused agent controlled access to those tools.
3. Let the agent detect issues, explain them, and prepare useful actions.
4. Require trainer approval before consequential actions.
5. Expand agent autonomy only after reliability and trust are demonstrated.

The first agent-driven workflow should be an **Operations Briefing**. It should retrieve
approved operational facts rather than calculate them itself, then present:

- Today's sessions and scheduling conflicts
- Unpaid or overdue balances
- Expiring packages and low remaining-session balances
- Missing or inconsistent records that need attention
- One prioritized operational follow-up
- An optional reminder or follow-up draft for trainer approval

The Business Health Agent follows later, after effective rate, future-session obligation,
capacity pressure, income-goal gap, and facility-cost rules are deterministic and
validated.

Early agents should not independently charge or refund money, send client messages,
cancel sessions, change prices, alter package terms, or delete records.

Trainer-enabled standard reminder templates belong to deterministic automation and may
send automatically after configuration. AI-written, customized, financial, pricing,
package-term, or dispute-related messages require per-action trainer approval.

---

## Recommended Agent Architecture

The best initial fit for Train Only is a set of **task-focused, tool-using agents with
human approval for consequential actions**.

### Recommended Patterns

1. **Tool-using agents**
   - The agent calls approved backend tools such as retrieving a schedule, checking
     balances, calculating package pressure, or drafting a reminder.
   - This is preferable to an agent that only chats because it can perform useful,
     verifiable work with actual Train Only data.

2. **Human-in-the-loop agents**
   - The agent proposes an action and the trainer approves, rejects, or edits it.
   - This should be the default for messages, schedule changes, pricing changes, and
     financial actions.

3. **Event-driven automation with agent escalation**
   - Deterministic automation evaluates known conditions when meaningful events occur,
     such as a completed session, overdue payment, expiring package, or schedule conflict.
   - An agent becomes involved only when the result needs prioritization, explanation,
     summarization, or a drafted response.

4. **Specialist agents**
   - Each agent owns a clear responsibility, such as Business Health, Scheduling,
     Payments, Client Acquisition, or Workout Planning.
   - Start with one or two reliable specialists rather than many shallow agents.

5. **Orchestrator or Chief-of-Staff agent, later**
   - A coordinating agent can route work between specialists and combine their findings.
   - This should come only after individual specialist tools and responsibilities are
     stable.

### Patterns To Avoid Early

- Fully autonomous agents making financial or scheduling decisions
- A large multi-agent swarm before individual agents are reliable
- Several named agents that only produce generic text
- Agents with direct unrestricted database access
- AI-generated calculations when deterministic code can calculate the answer exactly
- A user-configurable automation builder before built-in workflows are proven useful

### Automation And Agent Boundary

Train Only should keep four responsibilities distinct:

1. **Business logic** calculates and validates exact facts such as balances, remaining
   sessions, expiration, future-session obligation, and capacity pressure.
2. **Automation** reacts to known events and performs repeatable, predefined steps.
3. **Agents** interpret competing signals, explain priority, summarize context, and
   prepare drafts through approved backend tools.
4. **The trainer** approves ambiguous or consequential actions before automation carries
   them out.

The early product should use built-in automations with a small number of trainer settings,
not an arbitrary trigger-and-action builder.

### Technology Decision Still Required

The specific agent framework and model provider should be selected during backend
development after the required tools, approval flow, data privacy needs, expected costs,
and deployment environment are clearer.

The decision should compare:

- Tool calling and structured outputs
- Human-approval support
- Conversation and task-state persistence
- Evaluation and tracing support
- Security and data-retention behavior
- Model quality, latency, and operating cost
- Java/Spring Boot integration
- Ability to change model providers without rewriting core business logic

The product should depend on stable business interfaces, not on one provider-specific
prompt or framework.

---

## Primary Audience

The primary user is an independent personal trainer, especially one who is:

- New to the business side of training
- Managing clients through scattered tools or memory
- Unsure how to price sessions and packages
- Accepting discounted prepaid deals for immediate cash
- Carrying more future sessions than their schedule can comfortably fulfill
- Working hard without understanding why income still feels unstable

Train Only may support more established trainers later, but it should not become gym,
studio, or enterprise-management software during the early product stages.

The audience includes both full-time trainers and trainers who work part-time or as a
side gig. Both groups should share one strong operational foundation, while dashboard
priorities, guidance, and scenario tools may later adapt to the trainer's actual
availability, goals, costs, and commitments.

See `TrainerBusinessFit.md` for the approved direction on trainer operating modes,
side-gig differentiation, facility costs, income-capacity scenarios, and local
affordability context.

---

## Market Position

Major trainer platforms already offer broad combinations of workout programming,
nutrition, habits, messaging, payments, scheduling, client management, automation,
marketing, analytics, and group coaching.

Train Only should not compete by trying to match those feature catalogs.

Its differentiation should be:

> Train Only connects package, payment, session, pricing, capacity, and income-goal
> data to explain business pressure and recommend one next best move.

Business tools alone are not unique. The stronger opportunity is explainable business
guidance focused on the trainer's own financial and workload health.

### Focused Research Decisions — July 2026

| Reference | Role In The Research | Train Only Decision |
|-----------|----------------------|---------------------|
| [TrainerSuite](https://trainersuite.app/) | Closest direct comparison | Learn from its calendar-first records, package credits, and separation of collected versus earned income. Tracking and projections alone are not sufficient differentiation; Train Only must go further into Business Health and one Next Best Move. |
| [HoneyBook](https://www.honeybook.com/) | Primary workflow and automation reference | Strongly borrow connected client actions, event-driven workflows, approval gates, and AI-assisted preparation. Do not copy its generic CRM and project-management breadth. |
| [Square Appointments](https://squareup.com/us/en/appointments/pricing) | Scheduling and payment-protection reference | Learn from the connection between booking, packages, reminders, deposits, and cancellation policies. Use providers for payment infrastructure rather than rebuilding it. |
| [QuickBooks Solopreneur](https://quickbooks.intuit.com/learn-support/en-us/help-article/compare-products/introduction-quickbooks-solopreneur/L8TodvTOE_US_en_US) | Financial-record and guidance reference | Learn from record-grounded financial insight and scenario planning. Train Only should interpret training-specific obligations without becoming accounting or tax software. |
| [TrainerOS](https://traineros.app/) and [TrainerOS AI](https://www.traineros.uk/) | Secondary business and briefing references | Study storefront, billing, utilization, and briefing patterns, but do not let early or fragmented products drive Train Only's architecture. |
| [ABC Trainerize](https://www.trainerize.com/features/) | Established category reference and scope warning | Learn from its connected client experience and broad appeal. Avoid reproducing its workout, nutrition, habit, community, and add-on complexity. |

This comparison set is closed for the current planning cycle. Additional competitor
discovery should resume only when a specific product decision requires evidence that
these references cannot provide.

---

## Product Foundation

The existing management foundation remains necessary:

- Clients
- Packages and package terms
- Payments
- Sessions and participant attendance
- Remaining-session calculations
- Scheduling and cancellation history
- Lightweight workout-plan organization

These features are not separate from Business Health. They produce the data
needed for reliable analysis.

Train Only should not give important business advice from questionnaire answers alone
when the app can calculate the answer from real activity.

---

## Core Business Workflow

The working business flow is:

> Possible client later → client record → package commitment → payments and scheduled
> sessions → completed delivery → reliable business facts → Business Health → one Next
> Best Move → trainer-approved action

Prospect statuses remain a later decision. They do not block the reliable
client-package-payment-session workflow.

### Package And Session Rules

- A package creates a future-session obligation when the trainer confirms that the client
  has committed. Payment status does not control activation.
- In the trainer-only MVP, the trainer records commitment manually. Later client
  acknowledgment of visible package terms can provide the confirmation.
- Completed session and participant records consume a session automatically.
- A late cancellation or no-show consumes a session only after an explicit trainer
  decision based on the trainer's policy.
- A client may buy a new package before finishing the current package. Train Only should
  suggest the earliest-expiring active package for session use, show the selection, and
  allow the trainer to override it.
- An expired package with unused sessions should be flagged for resolution. The unused
  sessions must not be silently erased or treated as an ordinary active obligation.
- Payments remain separate from package commitment, earned value, and future-session
  obligation.

These rules guide later package and session operations. They do not require reopening the
completed database-foundation stage before the current backend scaffold is verified.

### HoneyBook Pattern Fit

Train Only should strongly borrow HoneyBook's connected-workflow pattern: reusable
package offerings later, clear client actions, event-driven steps, owner controls, and
AI that helps prepare work while explicit rules execute it.

Train Only should not copy HoneyBook's overall breadth. Generic project pipelines,
arbitrary tags, full contract and invoice builders, accounting, payment processing, and
a broad automation canvas would pull the product away from trainer-specific Business
Health and into generic small-business software.

### Workflow Drift Test

Before adding a workflow or automation, ask:

1. Does it improve the reliability of trainer-business records?
2. Does it provide trustworthy input for Business Health or a Next Best Move?
3. Does it reduce administrative or mental load without expanding into training-delivery
   features?
4. Are exact calculations kept in business logic rather than delegated to AI?
5. Does the trainer retain appropriate control over consequential actions?

A generic contact list, calendar, payment screen, CRM pipeline, or AI assistant does not
pass by itself. It must connect to trainer-specific package, payment, session, capacity,
or guidance data in a way that advances the product thesis.

---

## Current Project Position

Stage 2 — Database Foundation is complete for the current project scope and committed.
The database foundation supports:

- Trainers and clients
- Client-owned packages
- Payments and package balances
- Sessions with one or more participants
- Completed, scheduled, and cancelled session history
- Dynamic remaining-session calculations
- Effective price-per-session calculations
- Lightweight workout plans

The committed SQL includes realistic seed workflows, database safeguards, trainer
dashboard and client-history queries, multi-participant verification, and the files
needed to recreate the current foundation when starting from an empty database.

The active milestone is Stage 3 — Backend Foundation. Before expanding product scope,
the uncommitted Spring Boot scaffold must be verified for clean startup, Spring-managed
database-access design, a real MySQL connection, the first trainer-client endpoint, and
focused tests.

"Complete" here means the database meets the current foundation blueprint. It does not
mean the persistence layer is production-final. Backend validation, authentication,
migrations, and later Business Health data remain future work.

No current database work needs to be discarded because of the product-strategy change.
The existing package, payment, session, and attendance data is the foundation for later
Business Health calculations.

---

## Release Terminology

- **Development prototype:** Internal work used to build and test the system.
- **Private alpha or beta:** A limited release used with selected trainers for feedback.
- **First public release:** The first version offered to real customers. It should include
  at least one useful agent-driven workflow.
- **Feature V1:** The first usable version of one feature, such as Trainer Business
  Health. A feature V1 does not automatically mean the entire product's public V1.

---

## Business Health V1

The first Business Health release should remain deliberately narrow.

### Core Measures

1. **Effective session rate**
   - Package cost divided by total sessions.

2. **Future session obligation**
   - Paid or committed sessions the trainer still needs to deliver.
   - This is the preferred user-facing term instead of "session debt."

3. **Capacity pressure**
   - Future session obligations compared with the trainer's available training time.

4. **Income goal gap**
   - The difference between the trainer's income goal and reasonable projected income.

### Guidance

The first version should:

- Show each measure separately
- Explain how each result was calculated
- Use understandable states such as Healthy, Watch, High Pressure, or Insufficient Data
- Select one clear Next Best Move
- Explain why that action has priority

Example:

> Review your package pricing before accepting another discounted contract. Your
> current packages create more future training hours than your weekly capacity can
> comfortably fulfill at your current effective rate.

### What V1 Should Not Include

- An overall 0-100 score without validated weighting
- Fixed trainer-stage labels presented as scientific facts
- Marketing ROI as an equal first-release pillar
- Location-based price claims without trustworthy, current source data
- AI-generated calculations when deterministic rules can produce exact results
- A large onboarding questionnaire

---

## Data Collection Principle

Ask trainers only for information the app cannot calculate.

Good early inputs:

- Monthly income goal
- Maximum comfortable training hours or sessions per week
- Experience level
- General location
- Biggest current struggle
- Facility or gym-cost arrangement when it materially affects earnings

These inputs may be collected through a short Business Health Scan when that feature
stage begins. The scan should deliver value quickly and should not repeat questions the
app can answer from recorded activity.

Derive from app activity when possible:

- Active clients
- Package prices
- Sessions sold, completed, and remaining
- Effective session rate
- Payments received
- Schedule load
- Package expiration pressure

Trainer operating mode may later personalize defaults and presentation, but actual
availability, pricing, costs, and commitments should drive calculations.

This keeps onboarding lighter and makes recommendations more credible.

---

## Next Best Move

Next Best Move is a strong candidate for the central guidance experience.

It should represent the one business action most worth the trainer's attention
right now, based on recorded facts rather than generic advice. The strongest use
case is catching pressure before it turns into a rushed decision: for example, a
trainer receives a new package payment, but a gym or facility fee is due soon and
most of that cash is already spoken for while the trainer still owes the future
sessions created by the package.

In that situation, Train Only should not simply celebrate the payment or push the
trainer to sell another package. It should compare near-term obligations, unpaid
balances, available capacity, package pricing, and future sessions owed, then
recommend the safest useful focus.

It should:

- Choose one priority instead of producing a wall of advice
- Be tied directly to current data
- Change only when meaningful business conditions change
- Show the reason and calculation behind the recommendation
- Allow the trainer to retain control over the final decision
- Prefer safer business moves before acquisition when the facts support them, such
  as collecting overdue balances, reviewing pricing, or protecting capacity

Example:

> Follow up on overdue balances before creating a discount offer. Your gym fee is
> due soon, but selling another low-priced package may create more future sessions
> without solving the underlying cash pressure.

The system should be direct and supportive, not judgmental or falsely authoritative.

---

## Later Business Health Modules

Preserve these ideas, but do not place them in the first release:

- Trainer stages such as Starting Out or Busy but Unstable
- Recommendation history
- Accepted, rejected, modified, and completed recommendation states
- Marketing spend, leads, conversions, conversion rate, and acquisition cost
- Retention analysis
- Location-aware market comparisons with source dates and confidence
- Local affordability context using sourced median household income for the trainer's
  service area
- Facility-cost and effective-earnings scenarios
- Tailored full-time and part-time/side-gig dashboards
- Side-gig capacity, committed-workload, and "Can I comfortably accept another client?"
  tools
- Business Runway alerts and controlled pipeline-recovery workflows
- Competition or platform-saturation indicators
- Context-aware app and lead-platform recommendations
- Monthly or weekly business plans
- More advanced AI-generated explanations
- Chief-of-Staff-style coordination between specialized agents

Marketing ROI should be the next major Business Health module after pricing, future
session obligation, capacity, and income guidance are reliable.

---

## Product Boundaries

### Build

- Quiet, reliable trainer operations
- Transparent package and session tracking
- Explainable calculations
- Business warnings grounded in recorded data
- One useful recommendation at a time

### Save For Later

- Automated payments
- Broader lead and marketing intelligence
- Market-rate research
- Recommendation history
- Advanced AI assistance
- Client-facing polish beyond core transparency

### Avoid

- Copying every feature from broad coaching platforms
- Full nutrition, wearable, or exercise-library scope
- Gym-owner and multi-location management
- Large class and event management
- Generic motivational advice
- Arbitrary scores presented as objective truth
- Advice based on stale or unsupported external data

---

## Business Direction

The initial subscription price is a hypothesis, not a settled decision.

Pricing should be validated after a working prototype demonstrates measurable value.
Useful validation questions include:

- Does the product prevent one harmful package decision?
- Does it save meaningful administrative time?
- Does it help the trainer identify a pricing or capacity problem earlier?
- Would trainers trust it with business and financial information?
- Which guidance would trainers pay to receive repeatedly?

The product should earn trust before asking for detailed personal financial data.

---

## Product Validation

Train Only should validate the problem before investing heavily in the full Business
Health system.

Recommended validation:

- Interview independent trainers at different business stages
- Ask for anonymized examples of package, pricing, workload, and cash-flow problems
- Test whether "future session obligation" is understandable and useful language
- Show low-fidelity Business Health results and ask whether the advice feels credible
- Test whether one Next Best Move is more useful than several simultaneous warnings
- Learn which calculations trainers would trust enough to act on
- Measure whether trainers would repeatedly use and pay for the guidance

The first Business Health thresholds should be treated as hypotheses. They should be
adjusted using trainer feedback rather than presented as universal business truths.

---

## Strategic Risks

- **Scope risk:** Competing with broad platforms feature-for-feature would overwhelm the
  project and weaken differentiation.
- **Trust risk:** Financial and workload advice must show its calculation and limitations.
- **Data-quality risk:** Guidance becomes misleading when trainers do not maintain package,
  session, payment, or availability records.
- **False-precision risk:** Scores and stage labels can look more authoritative than the
  evidence supports.
- **Onboarding risk:** Asking for too much business and financial information before
  demonstrating value may cause abandonment.
- **Market-data risk:** Location pricing and platform recommendations can become stale or
  unreliable without current sources.

The response to these risks is a narrow, explainable first release built on recorded
activity and tested with real trainers.

---

## Success Criteria

The early product is successful if a trainer can:

- Reliably manage clients, packages, payments, and sessions
- See what they have sold and what they still owe
- Understand their effective package rate
- Recognize when workload and pricing are becoming unsustainable
- Receive one clear, explainable next action
- Feel more in control of the business without being overwhelmed

The strategic test is not the number of features. It is whether Train Only helps a
trainer make a better business decision than they would have made alone.
