# Trainer Business Fit Strategy

**Version:** 0.2
**Last Updated:** July 2026
**Status:** Approved product direction; implementation timing not yet selected

---

## Core Product Idea

Train Only should help independent personal trainers run a business that fits their
real life.

The app should not treat every trainer as if they have the same schedule, income needs,
facility costs, client capacity, or growth goals. It should combine reliable business
records with realistic constraints so the trainer can understand:

- What they have already committed to
- What they realistically have room for
- What they need to earn
- What their current pricing can support
- Whether the business is becoming difficult to carry
- Which business move deserves attention next

The central promise is:

> Train Only helps trainers build and manage a personal training business around the
> life they actually have, not an imaginary perfect schedule.

The emotional promise is:

> Train Only should feel like one less thing to stress over, not another app to manage.

---

## Product Identity

The strongest identity is broader than a side-gig mode:

> Train Only is a business confidence and mental-load reduction system for independent
> personal trainers.

Full-time and part-time trainers share the same operational foundation:

- Clients
- Packages
- Sessions
- Payments
- Remaining sessions
- Scheduling
- Availability
- Pricing
- Business costs
- Income and capacity goals
- Business Health

Trainer mode should personalize priorities, language, dashboard order, and suggested
workflows. It should not create a superior full-time product and an inferior side-gig
product.

The guiding principle is:

> Tailored, not reduced.

---

## Trainer Operating Modes

Possible modes:

- **Full-Time Trainer**
- **Part-Time / Side-Gig Trainer**

These modes are a personalization layer, not the main source of business calculations.
Actual availability, pricing, costs, client commitments, and goals should determine the
analysis.

The mode should be optional when first introduced, changeable as the trainer's business
changes, and used for defaults and emphasis rather than assumptions about seriousness.

A part-time trainer may run a disciplined, profitable business. A full-time trainer may
prefer a calm, limited workload instead of growth. The app should respect both.

Part-time and side-gig support should remain a potential standout identity. Trainer
testing should determine whether it eventually deserves a leading role in marketing.

---

## Shared Foundation, Different Priorities

### Full-Time Trainer Priorities

- Revenue consistency
- Client retention and renewals
- Unpaid balances
- Package expiration
- Schedule utilization
- Client and session volume
- Effective session rate
- Revenue compared with workload
- Overbooking and undercharging risk
- Sustainable growth

Full-time mode should not automatically push aggressive growth. Preferred workload and
personal business goals still matter.

### Part-Time / Side-Gig Trainer Priorities

- Realistic weekly session capacity
- Side-income goal progress
- Remaining available session slots
- Future-session obligations
- Estimated weeks of committed work
- Overcommitment warnings
- Preferred client-capacity monitoring
- Minimum worthwhile rate scenarios
- Low-administration business choices
- Quick weekly business check-ins
- "Can I comfortably accept another client?" scenarios
- A calm dashboard with a short list of next actions

The side-gig experience may contain more distinctive tools, not fewer tools. Its value
comes from protecting limited time and helping the trainer avoid building a stressful,
low-return business.

Features should generally remain available across modes. Mode changes what appears
first and what receives emphasis.

---

## Business Inputs

Train Only should ask only for information it can use responsibly.

### Strong Early Inputs

- Desired monthly personal-training income
- Realistic weekly client-training availability
- Typical session length
- Current session rate and package pricing
- Preferred maximum active clients
- Training location or facility arrangement
- Recurring gym or facility cost

### Useful Later Inputs

- Weekly administrative availability
- One optional required monthly income or expense total, without itemized household bills
- Optional income importance:
  - Extra income
  - Important supplemental income
  - Primary income
- Broad outside-commitment level
- Experience level and specialties
- Service area for market context

### Avoid Over-Collection

Do not require exact outside salary, employer information, itemized household bills,
family details, a complete non-training schedule, or detailed personal explanations.

If a later Business Health feature uses personal-expense pressure, prefer one optional
monthly total over a detailed list of rent, utilities, debt, or family expenses.

Train Only should understand business constraints without becoming a life-management,
banking, or financial-advising app.

---

## Income Goal And Capacity Scenarios

Train Only should compare the trainer's goal with actual capacity and pricing.

```text
Monthly training goal: $1,000
Average session revenue: $50
Sessions needed: 20
Estimated monthly capacity: 24
Capacity required to reach goal: about 83%
```

Possible guidance:

> Your goal fits your current availability, but it requires using most of your
> available session capacity.

Another scenario:

```text
Monthly training goal: $1,200
Estimated revenue at current rate and availability: $800
```

Possible guidance:

> Your current rate and availability may not support this goal yet. Explore pricing,
> package structure, or available hours before automatically adding more clients.

These are adjustable business scenarios, not guaranteed income forecasts or financial
advice.

---

## Facility And Gym Costs

Facility cost is essential to realistic pricing and income guidance.

A trainer may pay:

- No facility fee
- Fixed monthly rent
- A fee per training session
- A percentage of training revenue
- A combination of fixed and variable fees

```text
Training revenue collected: $1,200
Monthly gym fee: $450
Revenue after recorded facility cost: $750
```

Train Only may later calculate:

- Sessions needed to cover the facility fee
- Effective earnings per session after facility costs
- Revenue after recorded business costs
- Whether current pricing supports the trainer's income goal
- Whether a package discount becomes harmful after facility costs
- Whether a different facility arrangement would materially improve the business

Use "revenue after recorded business costs," not "take-home pay." Taxes and unrecorded
expenses may still apply.

Personal-experience scenario:

> A trainer earns package revenue but pays $450 each month to train clients at the gym.
> The dashboard should reveal how much of the apparent income is absorbed before the
> trainer treats the remaining money as available.

This is a strong example of Train Only reducing hidden business pressure.

---

## Local Affordability Context

Train Only may later use general income information for the trainer's service area to
provide cautious pricing context.

Use **median household income** rather than average household income when reliable data
is available. A small number of very high earners can distort an average.

Possible location levels:

- Service ZIP or ZIP Code Tabulation Area
- City
- County
- Metropolitan area

The trainer should choose a service area without providing a precise home address.

Local affordability context may compare:

- Median household income in the service area
- Trainer rates and packages
- Facility costs
- Trainer experience and specialties
- Intended client market
- Training format, such as in-person, virtual, or mobile

Example:

> Your current pricing may be high relative to general household income in this service
> area. Consider shorter sessions or flexible packages before reducing your standard
> rate.

Another example:

> Your rates appear conservative relative to local household income and your recorded
> facility costs. Review whether your pricing reflects your experience and expenses.

Local household income must never automatically set a price. It is one context signal,
not a complete measure of demand or willingness to pay.

Important limitations:

- A trainer's clients may live outside the immediate area.
- Online training is not limited by local income.
- Specialization and experience can justify higher pricing.
- Household income does not equal discretionary fitness spending.
- Higher-income areas do not guarantee demand.
- Lower-income areas may still support valuable niches.
- External data must include its source, geography, date, and confidence.

This feature should be described as **Local Affordability Context** or **Market
Affordability Context**, not an automatic pricing calculator.

---

## Capacity And Commitment Awareness

One of Train Only's strongest business concepts is translating sold packages into
understandable future workload.

```text
Future sessions still owed: 24
Weekly session capacity: 6
Estimated committed workload: 4 weeks
```

Possible message:

> You currently have about four weeks of committed sessions based on your available
> training time.

Prefer user-facing terms such as future-session obligation, sessions still owed,
committed sessions, and committed workload. Avoid accusatory wording such as "session
debt."

Capacity calculations should use actual weekly availability, session duration, scheduled
sessions, remaining package sessions, preferred client limit, and relevant facility
constraints. Trainer mode may change the urgency or placement of guidance, but not the
underlying math.

---

## Standout Side-Gig Tools

### Side-Gig Snapshot

```text
Available training slots this week: 3
Sessions scheduled: 2
Sessions still owed: 11
Monthly training goal: $600
Collected this month: $420
Clients needing attention: 1
```

### Can I Comfortably Accept Another Client?

The app can create a scenario using available hours, the existing schedule, package
obligations, preferred client capacity, expected revenue, and facility costs. The result
should show tradeoffs rather than command the trainer.

### Goal Reality Check

The app can estimate whether an income goal fits current pricing and availability, then
show adjustable options:

- Change the goal
- Change availability
- Review pricing
- Review package structure
- Improve schedule consistency

### Low-Admin Business Support

Later guidance may identify business structures that create unnecessary administrative
work, such as too many custom package types, unpaid follow-ups, or complicated
expiration rules.

These tools could become a leading reason side-gig trainers choose Train Only.

---

## Dashboard Personalization

### Full-Time Dashboard Emphasis

- Revenue and income-goal progress
- Client load and retention
- Unpaid balances
- Renewals and expiring packages
- Schedule utilization
- Effective session rate
- Business Health warnings

### Part-Time / Side-Gig Dashboard Emphasis

- This week's schedule
- Remaining capacity
- Sessions still owed
- Side-income progress
- Clients needing attention
- Overcommitment risk
- A small number of next actions

The part-time dashboard should feel calm, focused, and protective of the trainer's time.
It should not feel like a reduced product or an enterprise dashboard.

Trainers should eventually be able to customize dashboard priorities.

---

## Next Best Move

This strategy fits the existing Next Best Move concept. Train Only should avoid
overwhelming the trainer with many simultaneous warnings and identify one clear priority
when the data supports it.

Examples:

> Review package pricing before accepting another discounted contract. Your current
> packages create several weeks of future sessions at a low effective rate.

> Your income goal is close, but your available schedule is nearly full. A pricing
> review may fit your situation better than adding another client.

> Your recorded gym cost is absorbing a large share of training revenue this month.
> Review the number of sessions needed to cover that cost before offering another
> discount.

Recommendations should show the facts and calculations that produced them. The trainer
retains control.

---

## Business Runway And Pipeline Recovery

**Status:** Strong future Business Health workflow; not an immediate implementation
requirement.

### Problem

A trainer may operate close enough to the edge that one new client's payment is
immediately consumed by a gym fee or another fixed business cost. When the due date
approaches, the trainer may panic, lower prices, sell an unhealthy package, or accept
clients they do not have room to serve.

The deeper problem is not simply that a gym bill is due. It is that the trainer lacks
enough business runway to cover near-term fixed costs without making rushed decisions.

### Detection

A future Business Runway Alert may consider:

- Facility or fixed business cost due soon
- Projected training revenue below the near-term operating target
- Low active-client count
- Weak inquiry or other warm-prospect pipeline
- Unpaid balances that may be collectible
- Available capacity for another client
- Future-session obligations already owed
- Effective session rate and package profitability
- Cash collected compared with future labor created

The system should not trigger acquisition merely because one bill is approaching. It
must first determine whether the trainer has capacity and whether another action would
solve the pressure more safely.

### Safe Action Order

Possible responses should be evaluated in a responsible order:

1. Review collectible unpaid balances.
2. Follow up with existing interested inquiries or other warm prospects.
3. Reconnect with appropriate past clients.
4. Prepare a referral request for current clients.
5. Review unused schedule capacity.
6. Consider a limited starter offer that protects the standard rate.
7. Review facility cost, package pricing, or other business structure when the pressure
   is recurring.

Sometimes the correct Next Best Move is:

> Follow up on two unpaid balances.

It should not automatically be:

> Find another client.

### Pricing And Promotion Safeguards

The app should not default to lowering the trainer's standard rate. Panic discounts may
produce immediate cash while creating low effective rates, poor-fit clients, and more
future sessions than the trainer can comfortably deliver.

Safer possibilities include:

- Limited starter package
- Paid assessment
- Referral credit
- Bring-a-friend session
- Short package with clear expiration
- Limited opening at the normal rate

Before presenting an offer, Train Only should show:

- Immediate cash generated
- Effective session rate
- Future sessions created
- Facility-cost coverage
- Resulting capacity and committed-workload pressure

Example:

```text
3-session starter package
Immediate revenue: $180
Effective rate: $60 per session
Future sessions added: 3
Gym fee coverage after recorded costs: partial
```

### Progressive Capability

The workflow should develop in stages:

1. **Detection**
   - Explain the upcoming pressure and the data behind it.
2. **Suggested actions**
   - Offer a short list of safe, relevant options.
3. **Templates**
   - Prepare referral, warm-inquiry or prospect follow-up, or past-client messages for
     trainer review.
4. **Approved automation**
   - Run only workflows the trainer explicitly selects and approves.
5. **Agent support**
   - Later choose and explain the strongest move using reliable Business Health and
     pipeline data.

Train Only should not become an emergency sales bot that contacts people aggressively
when bills are due.

The intended experience is:

> Train Only detects business pressure early and helps the trainer activate a controlled
> pipeline-recovery workflow before panic decisions become necessary.

### Example Alert

```text
BUSINESS RUNWAY
Gym fee due in 6 days
Projected client revenue is below your near-term operating target
2 unpaid balances may need follow-up
Capacity available for 1 additional weekly client
```

Possible Next Best Move:

> Follow up on the unpaid balances first. If the gap remains, review three warm inquiries
> before creating a new promotion.

### Why It Fits Train Only

This workflow joins Business Health and Client Acquisition without turning
either one into generic marketing automation.

If validated later, the Smart Inquiry direction may provide reliable inbound source,
contact-permission, and conversion data for this workflow. It should organize interest
the trainer already received, not generate or purchase leads. See `SmartInquiry.md`.

It can help prevent:

- Panic discounting
- Underpricing
- Selling more sessions than the trainer can deliver
- Spammy outreach
- Accepting poor-fit clients
- Treating new-client money as relief without considering future labor

This is a strong future idea because it comes directly from a real trainer pain point
and turns scattered business information into one practical, controlled response.

---

## Tone And Psychological Appeal

Train Only should make the trainer feel:

- In control
- Professionally prepared
- Understood
- Protected from hidden commitments
- Less mentally overloaded
- Confident enough to make the next decision

The app should not scold, shame, or pressure the trainer to grow.

Avoid:

- "You need to work harder."
- "Add more clients."
- "You are failing."
- "Your business is unhealthy."

Prefer:

- "You may be approaching your preferred capacity."
- "This package could add several weeks of committed sessions."
- "You are close to your income goal without exceeding your preferred hours."
- "A pricing adjustment may fit your schedule better than another client."
- "Your client load fits the business pace you selected."

The experience should feel exclusive through personal fit, not restricted access:

> This app understands how I actually run my training business.

Train Only should complement calendars, banking apps, messaging tools, notes, and
workout apps. It should connect the business facts those tools do not combine.

---

## Visual Scenario Ideas

Visual concepts should reveal the business story progressively instead of creating a
dense dashboard.

### Capacity Card

```text
THIS WEEK
6 session slots available
5 already scheduled
1 comfortable opening
```

### Commitment Card

```text
COMMITTED WORKLOAD
18 sessions still owed
About 3 weeks at your current capacity
```

### Goal And Cost Card

```text
MONTHLY TRAINING GOAL
$1,000 goal
$820 collected
$450 gym cost recorded
```

### Next Best Move Spotlight

Show one visually prominent recommendation with the action, why it matters, the
calculation behind it, and a trainer-controlled next step.

These should feel premium, calm, and immediately understandable. Avoid walls of charts,
rows of database fields, or red warning screens.

---

## Business Model And Product Attraction

The subscription model remains a hypothesis to validate.

The strongest reasons a trainer may pay are:

- Preventing one harmful pricing or package decision
- Understanding future workload before selling more sessions
- Saving administrative time
- Avoiding facility-cost surprises
- Knowing whether an income goal fits available capacity
- Receiving one credible Next Best Move
- Feeling that the app understands a full-time or side-gig reality

Strong side-gig support may become a major acquisition message:

> Build consistent training income without letting the side business take over your
> life.

Broader product message:

> Train Only helps independent trainers understand what they have committed to, what
> they realistically have room for, and whether their business fits the life and income
> they want.

---

## Implementation Direction

### Preserve First

Continue building the reliable shared foundation:

- Trainers
- Clients
- Packages
- Payments
- Sessions
- Remaining-session calculations
- Effective session rate
- Scheduling and attendance history

### Add When The Foundation Is Ready

1. Optional business goals and capacity settings
2. Facility and gym-cost tracking
3. Capacity and committed-workload calculations
4. Income-goal scenarios
5. Optional trainer operating mode
6. Tailored dashboard order and language
7. Side-gig-specific scenario tools
8. Local affordability context with trustworthy external data

The operating mode should not be added merely as a label. It should arrive when the app
can use it to produce a meaningfully tailored experience.

---

## Data And Model Candidates

These are planning candidates, not approved database changes.

### Trainer Business Profile

- Trainer operating mode
- Desired monthly training income
- Weekly training availability
- Typical session length
- Preferred maximum active clients
- Optional income-importance category
- Optional weekly admin availability
- Optional service area

### Facility Cost Profile

- Facility name
- Fee type: none, fixed monthly, per session, percentage, or mixed
- Fixed monthly amount
- Per-session amount
- Revenue percentage
- Effective dates
- Active status

### Local Market Snapshot

- Service geography type and identifier
- Median household income
- Data source
- Source period or year
- Retrieval date
- Confidence or coverage note

External market data should be stored with provenance so stale or unsupported guidance
can be avoided.

---

## Guardrails

- Use actual availability, pricing, costs, and commitments for calculations.
- Use trainer mode for personalization, not unsupported assumptions.
- Do not give guaranteed income projections.
- Do not present business scenarios as financial advice.
- Do not set prices automatically from local household income.
- Do not collect exact outside income unless a later validated feature truly requires it.
- Do not treat side-gig trainers as less professional.
- Do not hide core business tools based on trainer mode.
- Do not replace existing calendar, banking, messaging, or productivity apps.
- Do not build advanced guidance before the operational data is trustworthy.
- Show calculations and limitations behind meaningful recommendations.

---

## Validation Questions

Test with both full-time and side-gig trainers:

- Does trainer mode feel useful or like an unnecessary label?
- Which dashboard priorities actually reduce mental load?
- Would trainers provide income goals and availability after seeing initial value?
- Are facility costs common enough to deserve early implementation?
- Is "future-session obligation" understandable?
- Does "Can I comfortably accept another client?" solve a real recurring decision?
- Does local affordability context feel useful, credible, or intrusive?
- Which business scenarios would trainers trust enough to act on?
- Would strong side-gig support make trainers choose Train Only over broader platforms?

Part-time and side-gig support should become a leading identity only if real trainers
confirm that it creates meaningful repeated value.
