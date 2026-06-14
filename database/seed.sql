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
    client_id,
    package_id,
    scheduled_at,
    duration_minutes,
    location,
    status,
    notes
)
VALUES
    (
        @client_id,
        @package_id,
        '2026-06-15 10:00:00',
        60,
        'LA Fitness',
        'completed',
        'Upper body workout'
    ),
    (
        @client_id,
        @package_id,
        '2026-06-17 10:00:00',
        60,
        'LA Fitness',
        'completed',
        'Leg day'
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