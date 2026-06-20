USE train_only_db;

INSERT INTO trainers (first_name, last_name, email, password_hash, phone)
VALUES ('Manley', 'Johnson', 'trainer@example.com', 'demo_hash_not_real_password', '713-555-0100');

SET @trainer_id = LAST_INSERT_ID();

INSERT INTO clients (
    trainer_id,
    first_name,
    last_name,
    email,
    password_hash,
    phone,
    date_of_birth
)
VALUES (
           @trainer_id,
           'Marcus',
           'Johnson',
           'marcus@example.com',
           'demo_hash_not_real_password',
           '832-555-0101',
           '1995-04-12'
       );

SET @client_id = LAST_INSERT_ID();

INSERT INTO packages (
    client_id,
    sessions_total,
    purchase_date,
    expiration_date,
    package_cost,
    locked_rate,
    status
)
VALUES (
           @client_id,
           12,
           '2026-06-01',
           '2026-07-15',
           600.00,
           FALSE,
           'active'
       );

SET @package_id = LAST_INSERT_ID();

INSERT INTO sessions (
    trainer_id,
    scheduled_at,
    duration_minutes,
    location,
    status,
    notes
)
VALUES (
           @trainer_id,
           '2026-06-15 10:00:00',
           60,
           'LA Fitness',
           'completed',
           'Upper body workout'
       );

SET @session_id = LAST_INSERT_ID();

INSERT INTO session_participants (
    session_id,
    client_id,
    package_id,
    status,
    notes
)
VALUES (
           @session_id,
           @client_id,
           @package_id,
           'completed',
           'Attended upper body session'
       );

INSERT INTO sessions (
    trainer_id,
    scheduled_at,
    duration_minutes,
    location,
    status,
    notes
)
VALUES (
           @trainer_id,
           '2026-06-17 10:00:00',
           60,
           'LA Fitness',
           'completed',
           'Leg day'
       );

SET @session_id = LAST_INSERT_ID();

INSERT INTO session_participants (
    session_id,
    client_id,
    package_id,
    status,
    notes
)
VALUES (
           @session_id,
           @client_id,
           @package_id,
           'completed',
           'Attended lower body session'
       );

INSERT INTO payments (
    client_id,
    package_id,
    amount,
    payment_date,
    due_date,
    payment_method,
    payment_type,
    status,
    notes
)
VALUES (
           @client_id,
           @package_id,
           600.00,
           '2026-06-01',
           '2026-06-01',
           'Cash App',
           'one_time',
           'paid',
           'Paid in full for 12-session package'
       );
INSERT INTO workout_plans (
    trainer_id,
    client_id,
    plan_name,
    workouts_per_week,
    goal,
    important_notes,
    status
)
VALUES (
           @trainer_id,
           @client_id,
           'Phase 1 - Strength Foundation',
           3,
           'Build consistency and strength with a simple weekly routine.',
           'Keep shoulder volume moderate and reassess after the first phase.',
           'active'
       );

SET @plan_id = LAST_INSERT_ID();

INSERT INTO workout_plan_days (
    plan_id,
    day_number,
    routine_focus,
    details
)
VALUES
    (
        @plan_id,
        1,
        'Upper Body',
        'Keep shoulder volume moderate.'
    ),
    (
        @plan_id,
        2,
        'Lower Body',
        'Focus on controlled movement quality.'
    ),
    (
        @plan_id,
        3,
        'Full Body',
        'Moderate intensity and conditioning focus.'
    );

-- Add a second client for realistic package, payment, and session testing.
INSERT INTO clients (
    trainer_id,
    first_name,
    last_name,
    email,
    password_hash,
    phone,
    date_of_birth
)
VALUES (
           @trainer_id,
           'Alicia',
           'Taylor',
           'alicia.taylor@example.com',
           'demo_hash_not_real_password',
           '713-555-0125',
           '1992-09-18'
       );

SET @alicia_client_id = LAST_INSERT_ID();


INSERT INTO packages (
    client_id,
    sessions_total,
    purchase_date,
    expiration_date,
    package_cost,
    locked_rate,
    status
)
VALUES (
           @alicia_client_id,
           8,
           CURRENT_DATE,
           DATE_ADD(CURRENT_DATE, INTERVAL 45 DAY),
           400.00,
           FALSE,
           'active'
       );

SET @alicia_package_id = LAST_INSERT_ID();

INSERT INTO payments (
    client_id,
    package_id,
    amount,
    payment_date,
    due_date,
    payment_method,
    payment_type,
    status,
    notes
)
VALUES (
           @alicia_client_id,
           @alicia_package_id,
           200.00,
           CURRENT_DATE,
           CURRENT_DATE,
           'Zelle',
           'one_time',
           'paid',
           'Partial payment toward 8-session package'
       );

INSERT INTO sessions (
    trainer_id,
    scheduled_at,
    duration_minutes,
    location,
    status,
    notes
)
VALUES (
           @trainer_id,
           DATE_SUB(
                   TIMESTAMP(CURRENT_DATE, '10:00:00'),
        INTERVAL 1 DAY
    ),
           60,
           'LA Fitness',
           'completed',
           'Completed session for Alicia'
       );

SET @alicia_completed_session_id = LAST_INSERT_ID();

INSERT INTO session_participants (
    session_id,
    client_id,
    package_id,
    status,
    notes
)
VALUES (
           @alicia_completed_session_id,
           @alicia_client_id,
           @alicia_package_id,
           'completed',
           'Alicia attended the session'
       );

INSERT INTO sessions (
    trainer_id,
    scheduled_at,
    duration_minutes,
    location,
    status,
    notes
)
VALUES (
           @trainer_id,
           DATE_ADD(TIMESTAMP(CURRENT_DATE, '10:00:00'), INTERVAL 3 DAY),
           60,
           'LA Fitness',
           'cancelled',
           'Cancelled session kept for history'
       );

SET @alicia_cancelled_session_id = LAST_INSERT_ID();

INSERT INTO session_participants (
    session_id,
    client_id,
    package_id,
    status,
    notes
)
VALUES (
           @alicia_cancelled_session_id,
           @alicia_client_id,
           @alicia_package_id,
           'cancelled',
           'Alicia cancellation recorded'
       );