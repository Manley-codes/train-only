# SECTION 2 — FEATURES

## Pillar 1 — Scheduling & Notifications

**Trainer can:**
- Create a session for one client now, with room for small-group sessions later
- Edit or cancel a session
- View a calendar of all upcoming sessions
- Receive a push notification reminder before each session (configurable — e.g. 1 hour before)
- See a daily summary of sessions for the day

**Client can:**
- View their upcoming scheduled sessions
- Receive a push notification reminder before their session

**Notes:**
- Sessions are calendar events; clients are attached through session participants
- Location field supports gym name, address, or virtual (e.g. Zoom link)
- Cancellations should be logged, not deleted, for record-keeping

---

## Pillar 2 — Payment Management

**Trainer can:**
- Record a payment received from a client (amount, date, method, package purchased)
- Mark a client as paid or unpaid
- View full payment history per client
- See outstanding balances at a glance
- Get notified when a client has an unpaid balance before a session

**Client can:**
- View their payment history
- See their current balance or package status

**Notes:**
- Phase 1 will be manual payment logging (trainer records it themselves)
- Phase 2 (future) may integrate with Stripe — avoids the PayPal-style blocking issues
- No automatic charging in Phase 1

---

## Pillar 3 — Workout Plan Management

**Trainer can:**
- Create a lightweight weekly routine plan and assign it to a client
- Set how many workouts per week the plan is designed for
- Add flexible routine days such as Upper Body, Lower Body, Full Body,
  or a custom focus
- Add important notes for injuries, limitations, intensity restrictions,
  or client preferences
- Mark a plan as draft, active, or archived

**Client can:**
- View their current workout plan
- See the weekly routine focus for each plan day
- See important notes the trainer chooses to share

**Notes:**
- Version 1 is not a full workout app or exercise library
- Routine days are flexible labels, not fixed calendar weekdays
- Default routine focuses are Upper Body, Lower Body, and Full Body
- Custom routine focuses are allowed when the default options do not fit
- Sessions may later reference a routine day to help trainers remember what was worked on last

---

## Pillar 4 — Client Acquisition

**Trainer can:**
- Access pre-written outreach message templates (editable)
- Log a prospect (potential client) with contact info and status
- Track prospect status (e.g. Contacted → Interested → Converted → Declined)
- See a simple pipeline view of all prospects

**AI Agent (future):**
- Suggest personalized outreach messages based on prospect info
- Recommend follow-up timing
- Analyze which acquisition approaches have the best conversion rate

**Notes:**
- This pillar benefits the most from the AI agent layer
- Phase 1 will be manual with smart templates
- Goal is to help trainers who are not naturally strong at sales
- Future Business Runway workflows may activate lead follow-up, past-client
  reactivation, or referral templates when fixed-cost pressure is detected
- Client acquisition should not activate automatically when collecting unpaid balances,
  reviewing costs, or protecting capacity would be safer
- Messages and campaigns require trainer review and approval

---

## Pillar 5 — Session Transparency

**Trainer can:**
- Define package terms when creating a client package
  (e.g. "12 sessions, must be completed within 45 days of purchase")
- View all active packages and their expiration dates
- Get notified when a client's package is expiring soon

**Client can:**
- See their package terms clearly on their home screen
- See the expiration date of their current package
- Receive a notification when their package is expiring

**Notes:**
- Package terms should be acknowledged by the client at purchase (simple confirmation step)
- This eliminates the "I didn't know" conversation before it starts

---

## Pillar 6 — Session Tracking

**Trainer can:**
- See exactly how many sessions a client has used and how many remain
- Mark a session as completed after it happens
- View a full session history per client (date, type, completed/cancelled)

**Client can:**
- See their remaining session count on their home screen at all times
- View their session history

**Notes:**
- The remaining session count is the single source of truth — both trainer and client
  see the exact same number
- Disputed counts always resolve to the app's logged history

---
## Pillar 7 — Trainer Sustainability (Trainer Business Health)

Future user-facing name TBD. "Trainer Business Health" is the working name for now.

**Trainer can:**
- Enter monthly personal expenses and income goals
- Set a maximum number of sessions per week
- Set their current session rate per client
- Record relevant gym or facility costs
- View a sustainability dashboard showing earnings vs expenses

**Business Health guidance (future):**
- Calculate the minimum monthly earnings needed based on personal expenses
- Recommend how many clients and sessions are needed to hit income goals
- Advise on session pricing based on location, experience level,
  market rates, and time of year
- Compare package prices against single-session rates and other packages
- Warn when a package discount is too aggressive or inconsistent
- Show when prepaid package money has been received but future training labor is still owed
- Estimate effective session rate, monthly package value, remaining sessions, and remaining labor value
- Suggest balanced package pricing based on session count, income goals,
  and trainer workload
- Warn when the trainer's current workload and pricing model may be becoming unsustainable
- Suggest when to raise rates or lock in longer packages ahead of slow seasons
- Flag when the trainer may be undercharging relative to their market
- Compare income goals with realistic availability, pricing, and facility costs
- Estimate sessions needed to cover recurring facility costs
- Show revenue after recorded business costs without presenting it as take-home pay
- Later personalize dashboard priorities for full-time and part-time/side-gig trainers
- Later provide sourced local affordability context using median household income for
  the trainer's service area
- Later detect Business Runway pressure when fixed costs are approaching and projected
  revenue, pipeline strength, or client capacity require attention
- Suggest a safe response order before recommending new-client acquisition
- Warn when a short-term promotion would create harmful pricing or future-session
  pressure

**Notes:**
- Personal financial data is sensitive — security and trust are essential
  before this feature is introduced to users
- Phase 1 will be manual input with basic calculations
- Rule-based pricing and sustainability guidance should come before AI-generated explanations
- Future sustainability analysis should consider money pressure, time pressure,
  pricing pressure, and energy pressure.
- Early versions should use simple totals instead of detailed personal bill
  breakdowns. Example: required monthly personal expenses.
- Later analysis may compare the trainer's rates against market-rate averages
  for their location, experience level, certifications, and training format.
- Trainer Business Health should help reveal the hidden cost of prepaid discounts,
  low contract pricing, stretched timelines, and future session obligations.
- Money received should not automatically be treated as fully earned when the
  trainer still owes future sessions.
- The goal is to help trainers avoid survival-mode deals that solve a short-term
  cash need but create long-term workload stress.
- The feature should feel like it is protecting the trainer from overwork and
  undercharging, not judging them.
- Trainer mode should tailor the experience, while actual availability, pricing, costs,
  and commitments drive the calculations.
- Part-time/side-gig mode should be tailored, not reduced. Core business tools should
  remain available across modes.
- Local household income is one market-context signal, not an automatic pricing rule.
- External market data must show its source, geography, date, and limitations.

---

## AI Agent Operating Principles

- AI agents are a core product feature and should appear in the first public release.
- Early agents should use approved backend tools and reliable Train Only data.
- Agents should perform focused tasks, not exist only as named chat personalities.
- Consequential actions require trainer approval, including sending messages, changing
  schedules, modifying prices or package terms, and initiating financial actions.
- Strong early tasks include daily briefings, issue detection, Next Best Move guidance,
  and drafting reminders or follow-ups for approval.
- Start with a small number of reliable specialist agents.
- Add Chief-of-Staff-style coordination only after individual agents are dependable.

---

## App Screens

### Trainer Screens
- Dashboard (daily summary — sessions today, unpaid clients, expiring packages)
- Client List
- Client Profile (sessions, plan, payments, package)
- Schedule / Calendar View
- Add / Edit Session
- Weekly Routine Planner
- Payment Log
- Prospect Pipeline
- Notifications / Alerts
- Settings

### Client Screens
- Home (remaining sessions, next session, package expiration)
- My Schedule
- My Workout Plan
- My Payment History
- Profile / Settings

---
