# Train Only — Direction (North Star)

**Version:** 1.2 (draft, in review)
**Last Updated:** July 2026
**Status:** Canonical working draft. Start here. Reflects the direction walkthrough with
Manley in June 2026. It sits *above* the detail docs so the direction can't be forgotten
or contradicted again. The original detail documents remain in place and are updated
deliberately as later decisions are accepted.

---

## 1. Core idea (what Train Only actually is)

One line:

> Train Only gives an independent personal trainer a tailored, adaptive direction for
> running their business — and adjusts it as the business changes — so trainers who are
> good at training but new to the business don't get overwhelmed and quit.

The problem it's for: a lot of people start training because they love the gym and got
results themselves, then find out they have no business background. They're all over the
place on pricing, clients, costs, and finding leads — and they burn out and quit. Train
Only is the experienced guidance they never had.

What it does and does not do:

- It **analyzes** the trainer's real business — experience, location, clients, pricing,
  costs, performance — and **advises** the next move: when and how to adjust before a bad
  outcome hits.
- It does **not run errands.** It won't go find leads or gyms for the trainer. It
  evaluates what the trainer is already doing and recommends adjustments. Coach, not
  concierge.

Naming: **"Business Health" is the strongest user-facing name** — concrete, grounded in
real data, and it won't overpromise. **"Mentor" is the internal north star** for how it
should feel. They aren't rivals: Business Health is the *engine* (the read on how the
business is doing); the mentor feeling is what turns that read into a direction the
trainer can follow.

---

## 2. The two layers (the order is the strategy)

**Layer A — Trustworthy Business Engine** (foundation, primary, the differentiator).
Reliable records and exact calculations from the trainer's *own* activity: clients,
packages, payments, sessions, attendance, remaining sessions, effective rate, capacity,
future-session obligation, facility cost, income-goal gap. This is what makes the
guidance credible and hard to copy.

**Layer B — Guidance / Mentor** (the emotional "why," delivered on top of A). Tailored,
adaptive direction delivered as **one reasoned move at a time**, grounded in Layer A data
plus the trainer's stated state (experience, budget, location, full- vs part-time).

"Mentor leads" describes **identity** — how the app is described and what it's for — not
**build order.** Build the engine first; lead with the guidance in the story. The mentor
is the destination, the data is the road.

---

## 3. How we handle new ideas — agile, not rigid

*(This is the part the June 2026 walkthrough wanted made explicit.)*

Train Only stays **agile** about scope. The point of having a direction is not to kill
ideas — it's to know where each one belongs.

- **The bar:** an idea that *slightly* goes out of scope is welcome when it is **strongly
  beneficial to the core idea.** Don't reject something just because it *could* be called
  scope creep.
- **The key move:** separate **accepting** an idea from **building** it now. Agile means
  no good idea gets thrown away — not that every good idea gets built next.
- So when a strong-but-not-now idea appears, **park it on the timeline** instead of
  rejecting it. Give it a home in a future stage.
- **Scope creep vs. agile roadmap:** scope creep is *unplanned* work that derails what
  you're building right now. An agile roadmap is *deliberately* accepting strong ideas
  into a later stage so they pull the app forward. We want the second, never the first.

Practical placement:

- **IN (build on the normal roadmap):** anything that records the trainer's real business,
  calculates exact measures from it, or turns that into one explainable next move.
- **SLIGHTLY OUT — allowed now as guidance:** advising on external decisions a mentor
  would help with (where to train more cheaply, whether a lead source is worth keeping),
  delivered under the discipline rules in §4. Analysis and advice, not directories.
- **PARKED FOR LATER (accepted, scheduled, revisit after launch):** bigger ideas that
  would be strong once the app is established — e.g. an actual gym/space *locator*. Not
  rejected; sequenced.
- **TRUE AVOID (these would break the product):** a full nutrition/wearable/exercise-
  library app, gym-owner or multi-location software, automatic charging early, generic
  motivational filler, arbitrary 0–100 scores, or any advice built on stale external data
  presented as fact.

---

## 4. Five discipline rules that keep the guidance from becoming "a wall of options"

The stated fear: a complex app that throws a bunch of options at the trainer to choose
from. These are the antidote — and they're what make staying agile *safe*:

1. **Guidance, not directories.** The app reasons from the trainer's situation to suggest
   a fitting option; it doesn't try to *be* a complete, always-current list of gyms,
   tools, or lead sources.
2. **One move at a time.** Always resolve to a single prioritized next move with its
   reasoning shown — never a menu.
3. **Trainer decides, then reports back.** The app suggests; the trainer acts and reports
   the outcome ("that worked," "got denied," "low return"). Those reported outcomes become
   the data that sharpens future advice — so we never have to maintain a perfect external
   database. This loop is what makes the guidance safe and self-improving.
4. **Layer A stays primary.** Guidance only appears when it's standing on reliable data.
5. **Provenance and humility on anything external.** Any outside/market claim shows its
   source, date, and limits — context, never an automatic fact or price.

---

## 5. Specific rulings (June 2026 walkthrough)

**Gym / training location**
- *Advisory version — IN, near-term.* When the trainer's gym cost is hurting the business,
  the app says: "your facility cost is eating your income; consider training outdoors or
  pursuing more at-home clients." Rides on the facility-cost data already planned.
- *Locator/finder version — PARKED for later, not rejected.* A real "find affordable,
  trainer-friendly spaces near you" feature is a future advancement: revisit once the app
  is out and proven, and if it would clearly level things up.

**Lead sources / acquisition tools — IN as advisory analysis**
- The app watches the return on how the trainer finds clients and advises: "this source
  has been beneficial — keep it," or "this one gets you leads but your return is very low —
  consider taking a break." It analyzes the trainer's own results; it does not go get
  leads.

**Smart Inquiry Assistant — ACCEPTED for later; not a current build task**
- Train Only may later turn trainer-owned interest from Instagram, referrals, QR codes,
  text, or another channel into a short inquiry and a useful business record.
- The potential-client experience stays intentionally small. The trainer owns the
  relationship and decides what happens next.
- This is not a lead marketplace, website builder, health intake, or autonomous sales
  system. Exact channels, trainer-review experience, lifecycle, and data model remain
  candidates to validate.
- See `SmartInquiry.md` for the accepted boundary, candidate design, open decisions, and
  implementation gates.

**Parks / outdoor training**
- Suggest outdoor/low-cost options as real possibilities; remind the trainer to check
  local permit rules; let them decide and report back. Benefit leads, risk is weighed — one
  trainer with one client in a park is far lower-risk than being thrown out of a commercial
  gym.
- *One hard line:* the app may suggest and remind-to-verify, but must **never** tell a
  trainer to skip a permit or ignore a rule.

---

## 6. What has NOT changed

- Build order is unchanged: reliable data → exact measures → one Next Best Move → agents on
  top of trustworthy tools.
- The eight-table database foundation is committed. The first Stage 3 backend foundation
  gate is verified and awaiting final repository/document hygiene and an intentional
  commit before package and session work continues.
- Business Health, full/part-time personalization, facility costs, capacity,
  income-goal scenarios, Business Runway — all still valid, all still later.
- Smart Inquiry is accepted as a future Client Acquisition and Business Health input. It
  does not displace the Operations Briefing as the planned first agent workflow.
- This work *names and bounds* something already implied across `ProductStrategy.md`,
  `TrainerBusinessFit.md`, and `Features.md`. It did not replace them.

---

## 7. Map to the detail docs

- `ProductStrategy.md` — full product thesis, agent architecture, Business Health V1.
- `TrainerBusinessFit.md` — full/part-time modes, capacity, facility costs, Business Runway.
- `SmartInquiry.md` — accepted future inbound-inquiry assistant, limits, data direction,
  validation, and staged delivery.
- `Features.md` — the seven pillars and screen list.
- `Roadmap.md` — stages and platform plan.
- `DesignVision.md` — look and feel ("most professional operation in the room").
- `DatabaseDesign.md` / `database/` — schema and rationale.
- `CodexCliHandoff.md` — how Manley and Codex split the work.

---

## 8. Small-group wording

Small-group training follows the rule: **structure now, feature later**.

The schema supports attaching more than one client to a session through
`session_participants`, but the full user-facing small-group management feature remains a
later roadmap item. This keeps the foundation flexible without pulling the current build
away from backend basics and trainer business-health direction.
