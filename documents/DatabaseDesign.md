# Train Only — Database Design
**Version:** 0.1
**Last Updated:** June 2026

---

## Overview

Eight active tables. Prospects and measurements are planned for later.
Records connect back to the trainer directly or through client/package relationships.

---

## Table Relationships
---

## Tables

### trainers
| Column | Type | Notes |
|--------|------|-------|
| trainer_id | INT | Primary key |
| first_name | VARCHAR(50) | |
| last_name | VARCHAR(50) | |
| email | VARCHAR(100) | Unique |
| password_hash | VARCHAR(255) | Encrypted |
| phone | VARCHAR(20) | |
| created_at | DATETIME | |

---

### clients
| Column | Type | Notes |
|--------|------|-------|
| client_id | INT | Primary key |
| trainer_id | INT | Foreign key → trainers |
| first_name | VARCHAR(50) | |
| last_name | VARCHAR(50) | |
| email | VARCHAR(100) | Unique |
| password_hash | VARCHAR(255) | Encrypted |
| phone | VARCHAR(20) | |
| date_of_birth | DATE | Used to calculate age |
| profile_picture_url | VARCHAR(255) | Link to stored image |
| created_at | DATETIME | |

---

### prospects (planned later)
| Column | Type | Notes |
|--------|------|-------|
| prospect_id | INT | Primary key |
| trainer_id | INT | Foreign key → trainers |
| first_name | VARCHAR(50) | |
| last_name | VARCHAR(50) | |
| age | INT | |
| email | VARCHAR(100) | Optional |
| phone | VARCHAR(20) | Optional |
| location | VARCHAR(255) | |
| source | VARCHAR(100) | Instagram, Referral, Thumbtack, etc |
| training_location_preference | VARCHAR(20) | gym, home, outdoor, flexible |
| training_type_preference | VARCHAR(20) | solo or group |
| free_trial_offered | BOOLEAN | Default false |
| last_contacted_date | DATE | |
| next_followup_date | DATE | |
| status | VARCHAR(20) | active, converted, unresponsive, not_interested |
| notes | TEXT | |
| created_at | DATETIME | |

---

### packages
| Column | Type | Notes |
|--------|------|-------|
| package_id | INT | Primary key |
| client_id | INT | Foreign key → clients |
| sessions_total | INT | Total sessions purchased |
| purchase_date | DATE | |
| expiration_date | DATE | Deadline to use all sessions |
| package_cost | DECIMAL(10,2) | |
| locked_rate | BOOLEAN | Keeps price fixed for returning clients |
| status | VARCHAR(20) | active, expired, completed |

---

### payments
| Column | Type | Notes |
|--------|------|-------|
| payment_id | INT | Primary key |
| client_id | INT | Foreign key → clients |
| package_id | INT | Foreign key → packages |
| amount | DECIMAL(10,2) | |
| payment_date | DATE | Nullable until money is actually received |
| due_date | DATE | |
| payment_method | VARCHAR(50) | Cash, Venmo, Zelle, Stripe, etc |
| payment_type | VARCHAR(20) | one_time or recurring |
| status | VARCHAR(20) | paid, pending, overdue |
| notes | TEXT | Optional |
| created_at | DATETIME | |

Payment rows can represent either money already received or money expected later.
For paid rows, `payment_date` records when the payment happened. For pending or
overdue rows, `payment_date` can stay blank until the trainer receives the money.
Train Only should warn the trainer about unpaid balances, but it should not
automatically punish the client, remove sessions, or enforce late fees in this
database version.

---

### sessions
| Column | Type | Notes |
|--------|------|-------|
| session_id | INT | Primary key |
| trainer_id | INT | Foreign key → trainers |
| scheduled_at | DATETIME | Date and time of session |
| duration_minutes | INT | |
| location | VARCHAR(255) | Gym, address, or virtual link |
| status | VARCHAR(20) | Event status: scheduled, completed, cancelled |
| notes | TEXT | Optional |
| created_at | DATETIME | |

The `sessions` table represents the training event on the calendar. It does not
belong to only one client anymore. A one-on-one session has one participant, while
a future small-group session can have multiple participants.

---

### session_participants
| Column | Type | Notes |
|--------|------|-------|
| session_participant_id | INT | Primary key |
| session_id | INT | Foreign key → sessions |
| client_id | INT | Foreign key → clients |
| package_id | INT | Foreign key → packages; must belong to the same client |
| status | VARCHAR(20) | Client attendance/status for this session |
| notes | TEXT | Optional notes for this client in this session |
| created_at | DATETIME | |

The `session_participants` table connects clients to sessions. This is what makes
small-group training possible later without redesigning the session table.

Example:
- One-on-one training: one `sessions` row and one `session_participants` row.
- Small-group training: one `sessions` row and two to four `session_participants` rows.

---

### workout_plans
| Column | Type | Notes |
|--------|------|-------|
| plan_id | INT | Primary key |
| trainer_id | INT | Foreign key → trainers |
| client_id | INT | Foreign key → clients |
| plan_name | VARCHAR(100) | e.g. "Marcus — Phase 1" |
| workouts_per_week | INT | Desired weekly training frequency |
| goal | TEXT | Main goal for the routine |
| important_notes | TEXT | Injuries, limitations, restrictions, or preferences |
| status | VARCHAR(20) | draft, active, archived |
| created_at | DATETIME | |
| updated_at | DATETIME | |

---

### workout_plan_days
| Column | Type | Notes |
|--------|------|-------|
| plan_day_id | INT | Primary key |
| plan_id | INT | Foreign key → workout_plans |
| day_number | INT | Flexible routine order, e.g. Day 1, Day 2 |
| routine_focus | VARCHAR(100) | Upper Body, Lower Body, Full Body, or custom |
| details | TEXT | Significant notes only |

---

### measurements (planned later)
| Column | Type | Notes |
|--------|------|-------|
| measurement_id | INT | Primary key |
| client_id | INT | Foreign key → clients |
| trainer_id | INT | Foreign key → trainers |
| recorded_date | DATE | |
| weight_lbs | DECIMAL(5,2) | |
| bmi | DECIMAL(4,2) | |
| chest_in | DECIMAL(5,2) | |
| waist_in | DECIMAL(5,2) | |
| hips_in | DECIMAL(5,2) | |
| arms_in | DECIMAL(5,2) | |
| thighs_in | DECIMAL(5,2) | |
| notes | TEXT | Optional |
