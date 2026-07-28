# Train Only Smart Inquiry Assistant

**Version:** 0.1
**Last Updated:** July 2026
**Status:** Accepted future product direction; not approved for current implementation
**Working name:** Smart Inquiry Assistant

---

## Product Decision

Train Only should eventually give each trainer a lightweight, trainer-owned path that
turns existing interest into an organized inquiry inside the management system.

The potential client should not need to download an app, navigate a full trainer
website, create an account, complete a long form, or answer detailed health questions.
The initial experience should feel like reaching a short, helpful receptionist by text.

The working promise is:

> A simple conversation for the potential client; a useful business record for the
> trainer.

The assistant is not a lead marketplace and does not find or sell leads. The trainer
owns the relationship and brings people to the inquiry path from places where interest
already exists, such as Instagram, a referral, a QR code, text, or another channel.

This direction is accepted because it can connect Client Acquisition to later Business
Health, marketing-return, capacity, and Business Runway guidance. It is not a current
Stage 3 implementation task and must not interrupt the approved package/session sequence.

### Decision Boundary

Accepted now:

- The future experience stays short, account-free, disclosed as AI, and controlled by
  the trainer.
- It organizes interest the trainer already attracted and creates reliable upstream
  business data.
- It does not perform detailed health intake, judge seriousness, sell leads, impersonate
  the trainer, or replace the trainer's consultation.
- The Operations Briefing remains the planned first agent workflow.

Candidates requiring validation:

- The exact public surface and first channel
- Whether trainers need an inbox, notification, or small pipeline
- The manual workflow, status lifecycle, transcript or summary needs, and data model
- Scheduling handoff, follow-up, approved FAQs, and source attribution details

Accepting the direction does not approve these candidate implementation choices.

---

## Strategic Fit

The Smart Inquiry Assistant fills the currently undeveloped beginning of Train Only's
business workflow:

```text
Interest
    -> optional inquiry
    -> trainer review and response
    -> consultation or other trainer-decided next step
    -> client
    -> package, payment, and sessions
    -> reliable business facts
    -> Business Health and one Next Best Move
```

It passes the Product Strategy workflow-drift test only when it does more than create a
generic contact list or chatbot. It must:

- Reduce missed, scattered, or incomplete inbound inquiries
- Produce reliable source and conversion data
- Connect an inquiry to the client record if the trainer accepts the person
- Preserve trainer control over contact, consultation, pricing, and acceptance
- Give later Business Health features trustworthy acquisition context

The AI conversation is not the differentiator by itself. The stronger value is the
connection between the inquiry and the trainer's actual business records.

---

## Candidate Potential-Client Experience

The leading first experiment is mobile-first and deliberately short. The exact public
surface and channel remain open decisions.

Example entry point:

> Interested in training with me? Ask my training assistant.

Example interaction:

```text
Assistant: Hi, I am Jordan's Train Only assistant. I can collect a few details for
Jordan. Are you interested in in-person, online, or another type of training?

Potential client: In person.

Assistant: What kind of training help are you looking for?

Potential client: Strength training and weight loss.

Assistant: When are you hoping to begin, and what days or times normally work?

Potential client: In the next few weeks. Weekday evenings.

Assistant: Thanks. What is the best way for Jordan to contact you?
```

The assistant should then set an honest expectation and end the intake:

> Thanks. I passed your inquiry to Jordan. Jordan will decide the best next step and
> follow up using the contact method you selected.

The conversation should normally collect only:

- Name
- Preferred contact method and contact value
- Broad training interest or goal
- In-person, online, hybrid, or another trainer-supported format
- Desired start timing
- Broad availability
- Optional location or service-area fit when relevant
- Permission for the trainer to contact the person

It should ask only what is needed to create a useful first inquiry. The trainer owns the
real consultation and any later health or readiness intake.

---

## What The Assistant May Do

- Clearly identify itself as an AI assistant working for the trainer
- Answer a small set of trainer-approved business questions
- Ask a short built-in sequence of basic inquiry questions
- Adapt the order or wording when the person has already supplied an answer
- Clarify an incomplete logistical answer once
- Collect contact permission
- Create a structured inquiry through an approved backend action
- Confirm that the inquiry was passed to the trainer
- Fall back to a basic form or saved partial inquiry if AI is unavailable

The assistant may later retrieve trainer-approved service descriptions, testimonials,
or public media, but those capabilities are outside the first public version and require
separate privacy, permission, and claims rules.

---

## What The Assistant Must Not Do Initially

- Search for, purchase, distribute, or sell leads
- Pretend to be the trainer
- Decide that a person is serious, worthy, or suitable based on tone or personal traits
- Produce an arbitrary lead-quality score
- Collect detailed medical history, diagnoses, medications, or injury assessments
- Diagnose, prescribe, or provide individualized fitness or nutrition advice
- Conduct the trainer's complete consultation
- Promise results, availability, pricing exceptions, or acceptance
- Negotiate package terms or discounts
- Create a client, package, payment, or session without trainer-controlled workflow
- Automatically contact the person after the initial inquiry unless the person and
  trainer have explicitly enabled a defined follow-up workflow
- Send AI-written messages as the trainer without review
- Become a general website builder, CRM suite, marketing platform, or automation canvas

These boundaries keep the public interaction simple and prevent Client Acquisition from
overtaking the Business Health product identity.

---

## Terminology

Use **inquiry** for the first stored record.

An inquiry means that a person expressed interest and supplied enough information for
the trainer to review. It does not imply that the person has been qualified or that the
trainer will accept them.

Prefer:

- Inquiry
- Potential client
- New training interest
- Trainer review
- Service and schedule fit

Avoid presenting these as objective facts:

- Bad lead
- Unqualified person
- Not serious
- Low-value prospect
- AI-approved client

The trainer may decide an inquiry is not a fit, but the product should preserve the
facts and avoid judgmental labels.

---

## Candidate Trainer Experience Inside Train Only

The assistant's more substantial work happens inside the management system after or
during the short public conversation.

For each inquiry, Train Only should be able to prepare:

- Potential-client name and contact preference
- Source, such as Instagram bio link, referral QR code, or manual entry
- Stated training interest
- Preferred training format
- Start timing and broad availability
- A concise factual summary
- Missing information, without treating it as a failure
- Whether contact permission was given
- When the inquiry arrived
- Whether the trainer has reviewed it
- The trainer-controlled next action

Example trainer card:

```text
NEW INQUIRY
Maya - from Instagram

Interested in in-person strength and weight-loss support.
Wants to begin within a few weeks. Available weekday evenings.
Prefers text contact and gave permission to be contacted.

Next step: Review and respond
```

An **Inquiry Inbox** is one candidate, not an approved screen. Validation should compare
an inbox with a notification-and-summary flow and a small pipeline. Whatever is chosen
must remain smaller than a generic CRM and answer:

1. Who is waiting for me?
2. What are they looking for?
3. What do I need to do next?

Possible inquiry states are planning candidates only:

- New
- Reviewed
- Contacted
- Consultation scheduled
- Converted
- Closed

Closure reasons and status history should be added only when they support useful trainer
follow-up or reliable conversion analysis.

---

## Trainer Configuration

Early configuration should remain small and built in. Possible settings are:

- Assistant enabled or disabled
- Trainer display name
- Supported training formats
- General service area
- A small set of approved frequently asked questions and answers
- Preferred contact handoff
- Whether consultation requests are accepted
- Optional availability guidance when reliable schedule data exists

Do not build an arbitrary question-and-automation designer. Train Only should first prove
one safe default inquiry workflow.

---

## Entry Channels And Platform Boundary

### Leading First Experiment

A trainer-specific public link controlled by Train Only is the leading first experiment,
not a locked platform decision. The trainer could place it in an Instagram bio, send it
by text, attach it to a QR code, or share it elsewhere.

This approach lets Train Only prove the interaction and business workflow without making
the first version dependent on one social platform.

### Later Channels

Treat each of the following as a separate later integration:

- Native Instagram direct messages
- SMS or messaging-platform conversations
- AI voice calls
- Other social or marketplace channels

Native platform integrations require their own authorization, permissions, webhooks,
failure handling, policy monitoring, and channel-specific testing. Voice additionally
requires telephony, speech, latency, recording or transcript, cost, and consent design.

The public link, native Instagram messaging, and voice are not three versions of one
small implementation task. They are separate delivery stages sharing one inquiry domain.

---

## Candidate Data Direction

These are planning candidates, not approved schema changes.

### Inquiry

- Inquiry ID
- Trainer ID
- Public entry-link or source reference
- Name
- Preferred contact method
- Email or phone when supplied
- Contact-permission timestamp
- Training-interest summary
- Training-format preference
- Desired start timing
- Broad availability
- Optional service-area information
- Initial free-text question or message
- Structured factual summary
- Status
- Trainer-reviewed timestamp
- Converted client ID when applicable
- Closed timestamp and optional reason
- Created and updated timestamps

### Inquiry Message Or Transcript

If retaining a conversation is necessary for trainer handoff, quality review, or dispute
resolution, store only the content and metadata needed for those purposes. Define a
retention period for people who never become clients.

### Inquiry Entry Link

A trainer may eventually have more than one share link so Train Only can distinguish an
Instagram bio link, referral QR code, or other trainer-controlled source without relying
on inconsistent free-text source names.

### Trainer Inquiry Settings

Store only settings used by the built-in workflow. Do not create an unrestricted prompt
or automation builder.

The final data model should be approved after manual workflow validation. It must remain
separate from the active `clients` table until the trainer deliberately converts the
inquiry.

---

## AI And Backend Boundary

The assistant must use narrow backend actions and structured results.

```text
Potential-client message
    -> AI interprets within approved limits
    -> AI proposes structured inquiry fields
    -> backend validates the fields and permissions
    -> backend stores the inquiry
    -> trainer reviews and decides
```

The AI must not have unrestricted database access. Exact status changes, trainer
ownership, contact consent, conversion, and later business calculations belong to
deterministic application logic.

The model provider should sit behind a stable application interface so the inquiry
domain does not depend on one provider-specific prompt or response shape.

If the AI provider is unavailable or uncertain, the person should still be able to
submit a basic inquiry. The feature must not make a trainer's only contact path depend on
successful model output.

---

## Public Security And Privacy Requirements

This feature introduces Train Only's first intentionally public surface. Before it is
built, the project needs:

- An authenticated trainer boundary for private management actions
- An opaque public trainer link or token rather than a trusted numeric trainer ID
- Tenant-isolation tests
- Input validation and message-size limits
- Rate limiting and spam or abuse controls
- Safe logging that does not expose inquiry content unnecessarily
- Clear AI disclosure
- Clear contact-consent capture
- A retention and deletion policy for people who never become clients
- Documented third-party AI and channel data flows
- A safe path for partial submissions and provider failures

Data minimization is part of the product design. Detailed health information should not
be collected simply because an open conversation makes it possible.

---

## Relationship To Business Health

The first assistant should create reliable inquiry records, not Business Health advice.
Later, aggregated inquiry outcomes may support:

- Inquiry volume by source
- Trainer response time
- Inquiry-to-consultation conversion
- Consultation-to-client conversion
- Source-to-client and source-to-package value
- Whether available capacity matches current inquiry demand
- Whether Business Runway guidance can safely prioritize warm-inquiry follow-up
- Whether a trainer has a demand problem, response problem, conversion problem, or
  capacity constraint

Do not optimize solely for more inquiries or more clients. Business Health must still
consider capacity, package pricing, future-session obligation, facility cost, and the
trainer's preferred business pace.

---

## Public Testimonials, Results, And Progress Media

Showing trainer-approved testimonials or before-and-after media inside a conversation is
a separate future capability, not part of Smart Inquiry V1.

If it is later accepted, Train Only must require:

- Explicit client authorization for public promotional use
- Trainer selection of each approved asset
- A way to revoke and remove an asset
- Clear separation between private client progress and public marketing media
- Accurate context and no AI-generated result claims
- Review of applicable privacy and advertising requirements

The existing future Client Progress Gallery should remain private-by-default unless a
separate public-use workflow is intentionally designed.

---

## Validation Before Implementation

Research should include trainers who already receive inbound interest through Instagram,
referrals, text, or other channels.

Recommended validation:

- Review anonymized examples of recent trainer inquiries
- Learn what trainers actually need before deciding to respond
- Test whether four to six basic questions feel helpful or excessive
- Compare a short conversation with a basic form
- Test whether trainers want an inbox, notification, or pipeline
- Determine how often inquiries are missed or lack needed information
- Measure whether source and conversion tracking would change a business decision
- Confirm that trainers with low inquiry volume still see enough value

Do not validate the idea only by asking whether an AI assistant sounds appealing. Test
whether the structured result saves time, improves follow-through, or produces useful
business data.

### Candidate Success Measures

- Completed inquiry rate
- Time required for a potential client to finish
- Trainer review and response time
- Percentage of inquiries receiving a trainer-decided next action
- Inquiry-to-consultation and inquiry-to-client conversion
- Reduction in incomplete or lost inquiries
- Trainer-reported usefulness of the summary
- Cost per completed inquiry

### Guardrail Measures

- Conversation abandonment
- Incorrect or unsupported assistant answers
- Spam and duplicate-inquiry rate
- Sensitive information collected unnecessarily
- Potential clients who believed they were speaking directly to the trainer
- Trainer promises or availability represented inaccurately
- Good inquiries incorrectly deprioritized

---

## Staged Delivery

### Current Stage 3 - Preserve, Do Not Implement

- Keep this feature accepted but unimplemented
- The first backend foundation gate is verified and awaiting final hygiene and commit
- Continue the approved package/session sequence after that commit
- Establish authentication and tenant ownership before copying public-looking data
  access patterns broadly
- Establish versioned migrations before the next schema change
- Do not change the active database schema for Smart Inquiry yet

### Trainer Management Validation - Test The Workflow First

- Validate how trainers receive and review inquiries
- Compare a manually operated prototype, notification, inbox, and small pipeline only
  after core trainer operations are reliable
- Prove useful statuses and conversion behavior without AI

### Expanded Intelligence - Candidate Public Text Assistant

- Add the trainer-controlled public inquiry link
- Add the short AI conversation and deterministic fallback
- Create structured inquiries through approved backend actions
- Connect conversion to later acquisition and Business Health analysis

### Later Channel Expansion

- Evaluate native Instagram messaging only after the public-link workflow proves value
- Evaluate voice separately
- Evaluate public testimonials or media separately
- Add approved follow-up automation only after consent, templates, and trainer controls
  are reliable

The Operations Briefing remains the planned first agent-driven workflow. Smart Inquiry
should not displace it unless future validation produces strong evidence and the product
strategy is explicitly revised.

---

## Entry Criteria For Building Smart Inquiry

Implementation should not begin until:

- The backend foundation is committed and verified
- Authentication and trainer ownership are enforced
- A migration approach exists for additive schema changes
- Core client, package, payment, and session operations are reliable
- The manual inquiry workflow has been tested with trainers
- The first public surface and hosting boundary are deliberately selected
- Privacy, retention, abuse, and AI-fallback requirements are documented
- The feature has one primary success measure and explicit guardrails

This entry checklist is the discipline mechanism. Accepting the idea now does not make it
the next implementation task.

---

## Open Decisions

- Final user-facing feature name
- Whether manual inquiry capture belongs in the Trainer Management MVP or a later stage
- Whether the first public path is a small web experience or another Train Only-controlled
  surface
- How much approved business information the assistant may answer
- Whether the trainer or potential client initiates later scheduling
- Which contact methods are supported first
- How long incomplete and unconverted inquiries are retained
- Whether a full transcript is necessary or a structured summary is sufficient
- Whether conversion creates a new client identity or connects an existing identity
- Which trainer segments receive enough inbound inquiries for the feature to justify its
  cost

These decisions should be made from workflow validation and security needs, not from the
desire to make the assistant appear more advanced.
