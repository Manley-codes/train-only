# SECTION 2 — FEATURES

## Pillar 1 — Scheduling & Notifications

**Trainer can:**
- Create a session for a specific client (date, time, location)
- Edit or cancel a session
- View a calendar of all upcoming sessions
- Receive a push notification reminder before each session (configurable — e.g. 1 hour before)
- See a daily summary of sessions for the day

**Client can:**
- View their upcoming scheduled sessions
- Receive a push notification reminder before their session

**Notes:**
- Sessions must be tied to a specific client record
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
- Create a workout plan and assign it to a client
- Build a plan from exercises (name, sets, reps, rest time, notes)
- Edit a plan at any time
- Duplicate a plan to use as a template for another client
- View all plans in one organized list

**Client can:**
- View their current workout plan
- See exercise details (sets, reps, rest, notes)
- Mark a session's workout as completed (optional check-in feature)

**Notes:**
- Plans should be versioned — if a trainer updates a plan, the history is kept
- Exercise library (a reusable list of exercises) would reduce repetitive data entry

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
## Pillar 7 — Trainer Sustainability (The Overdrive Trap)

**Trainer can:**
- Enter monthly personal expenses and income goals
- Set a maximum number of sessions per week
- Set their current session rate per client
- View a sustainability dashboard showing earnings vs expenses

**AI Agent (future):**
- Calculate the minimum monthly earnings needed based on personal expenses
- Recommend how many clients and sessions are needed to hit income goals
- Advise on session pricing based on location, experience level,
  market rates, and time of year
- Warn when the trainer is approaching or in the overdrive zone
- Suggest when to raise rates or lock in longer packages ahead of slow seasons
- Flag when the trainer may be undercharging relative to their market

**Notes:**
- Personal financial data is sensitive — security and trust are essential
  before this feature is introduced to users
- Phase 1 will be manual input with basic calculations
- AI pricing intelligence added in Stage 5

---

## App Screens

### Trainer Screens
- Dashboard (daily summary — sessions today, unpaid clients, expiring packages)
- Client List
- Client Profile (sessions, plan, payments, package)
- Schedule / Calendar View
- Add / Edit Session
- Workout Plan Builder
- Exercise Library
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