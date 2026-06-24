USE train_only_db;

-- Show every client with the trainer they belong to.
SELECT
    c.client_id,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    c.email AS client_email,
    CONCAT(t.first_name, ' ', t.last_name) AS trainer_name,
    t.email AS trainer_email
FROM clients c
         JOIN trainers t
              ON c.trainer_id = t.trainer_id;

-- Calculate sessions remaining for each active package.
SELECT
    c.client_id,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    p.package_id,
    p.sessions_total,
    COUNT(s.session_id) AS sessions_used,
    p.sessions_total - COUNT(s.session_id) AS sessions_remaining
FROM packages p
         JOIN clients c
              ON p.client_id = c.client_id
         LEFT JOIN session_participants sp
                   ON p.package_id = sp.package_id
                       AND sp.status = 'completed'
         LEFT JOIN sessions s
                   ON sp.session_id = s.session_id
                       AND s.status = 'completed'
WHERE p.status = 'active'
GROUP BY
    c.client_id,
    c.first_name,
    c.last_name,
    p.package_id,
    p.sessions_total;

-- Show scheduled sessions with the clients attached to each session.
SELECT
    s.session_id,
    s.scheduled_at,
    s.duration_minutes,
    s.location,
    s.status AS session_status,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    sp.status AS participant_status,
    sp.notes AS participant_notes
FROM sessions s
         JOIN session_participants sp
              ON s.session_id = sp.session_id
         JOIN clients c
              ON sp.client_id = c.client_id
ORDER BY
    s.scheduled_at,
    c.last_name,
    c.first_name;

-- Show each payment with the client and package it belongs to.
SELECT
    pay.payment_id,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    p.package_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method,
    pay.payment_type,
    pay.status,
    pay.notes
FROM payments pay
         JOIN clients c
              ON pay.client_id = c.client_id
         LEFT JOIN packages p
                   ON pay.package_id = p.package_id;

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    wp.plan_name,
    wp.workouts_per_week,
    wp.goal,
    wpd.day_number,
    wpd.routine_focus,
    wpd.details
FROM workout_plans wp
         JOIN clients c
              ON wp.client_id = c.client_id
         JOIN workout_plan_days wpd
              ON wp.plan_id = wpd.plan_id
WHERE wp.status = 'active'
ORDER BY
    c.last_name,
    c.first_name,
    wpd.day_number;

-- Show each client with their active package, session usage, and payment summary.


SELECT
    c.client_id,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    c.email,
    c.phone,
    p.package_id,
    p.purchase_date,
    p.expiration_date,
    p.sessions_total,

    COALESCE(sc.sessions_used, 0) AS sessions_used,

    p.sessions_total - COALESCE(sc.sessions_used, 0)
                                           AS sessions_remaining,

    p.package_cost,

    ROUND(
            p.package_cost / NULLIF(p.sessions_total, 0),
            2
    ) AS effective_price_per_session,

    COALESCE(pt.total_paid, 0.00) AS total_paid,

    p.package_cost - COALESCE(pt.total_paid, 0.00)
                                           AS remaining_balance,

    p.status AS package_status

FROM clients c

         JOIN packages p
              ON c.client_id = p.client_id

         LEFT JOIN (
    SELECT
        sp.package_id,
        COUNT(*) AS sessions_used
    FROM session_participants sp
             JOIN sessions s
                  ON sp.session_id = s.session_id
    WHERE sp.status = 'completed'
      AND s.status = 'completed'
    GROUP BY sp.package_id
) sc
                   ON p.package_id = sc.package_id

         LEFT JOIN (
    SELECT
        package_id,
        SUM(amount) AS total_paid
    FROM payments
    WHERE status = 'paid'
      AND package_id IS NOT NULL
    GROUP BY package_id
) pt
                   ON p.package_id = pt.package_id

WHERE p.status = 'active'

ORDER BY
    c.last_name,
    c.first_name;

-- Show today's non-cancelled sessions for the trainer dashboard.
SELECT
    s.session_id,
    TIME(s.scheduled_at) AS session_time,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    s.duration_minutes,
    s.location,
    s.status AS session_status,
    sp.status AS participant_status
FROM sessions s
    JOIN session_participants sp
ON s.session_id = sp.session_id
    JOIN clients c
    ON sp.client_id = c.client_id
WHERE DATE(s.scheduled_at) = CURRENT_DATE
  AND s.status <> 'cancelled'
  AND sp.status <> 'cancelled'
ORDER BY
    s.scheduled_at,
    c.last_name,
    c.first_name;


-- Show upcoming scheduled sessions for the trainer dashboard.
SELECT
    s.session_id,
    s.scheduled_at,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    s.duration_minutes,
    s.location,
    s.status AS session_status,
    sp.status AS participant_status
FROM sessions s
         JOIN session_participants sp
              ON s.session_id = sp.session_id
         JOIN clients c
              ON sp.client_id = c.client_id
WHERE s.scheduled_at >= CURRENT_TIMESTAMP
  AND s.status = 'scheduled'
  AND sp.status = 'scheduled'
ORDER BY
    s.scheduled_at,
    c.last_name,
    c.first_name;


-- Show active packages expiring within 14 days with sessions remaining.
SELECT
    c.client_id,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    p.package_id,
    p.expiration_date,
    DATEDIFF(p.expiration_date, CURRENT_DATE) AS days_until_expiration,
    p.sessions_total,
    COALESCE(sc.sessions_used, 0) AS sessions_used,
    p.sessions_total - COALESCE(sc.sessions_used, 0)
        AS sessions_remaining
FROM packages p
         JOIN clients c
              ON p.client_id = c.client_id
         LEFT JOIN (
    SELECT
        sp.package_id,
        COUNT(*) AS sessions_used
    FROM session_participants sp
             JOIN sessions s
                  ON sp.session_id = s.session_id
    WHERE sp.status = 'completed'
      AND s.status = 'completed'
    GROUP BY sp.package_id
) sc
                   ON p.package_id = sc.package_id
WHERE p.status = 'active'
  AND p.expiration_date BETWEEN CURRENT_DATE
    AND DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY)
  AND p.sessions_total - COALESCE(sc.sessions_used, 0) > 0
ORDER BY
    p.expiration_date;


-- Show pending or overdue payment warnings for the trainer dashboard.
SELECT
    pay.payment_id,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    pay.package_id,
    pay.amount,
    pay.due_date,
    pay.status AS payment_status,

    CASE
        WHEN pay.due_date IS NULL
            THEN 'Due date missing'

        WHEN pay.status = 'overdue'
            THEN CONCAT(
                DATEDIFF(CURRENT_DATE, pay.due_date),
                ' days overdue'
                 )

        WHEN pay.due_date = CURRENT_DATE
            THEN 'Due today'

        WHEN pay.due_date > CURRENT_DATE
            THEN CONCAT(
                DATEDIFF(pay.due_date, CURRENT_DATE),
                ' days until due'
                 )

        ELSE 'Past due - review payment status'
        END AS payment_timing,

    pay.notes
FROM payments pay
         JOIN clients c
              ON pay.client_id = c.client_id
WHERE pay.status IN ('pending', 'overdue')
ORDER BY
    pay.due_date,
    c.last_name,
    c.first_name;

-- Show the full session history for one client.
SET @history_client_id = (
    SELECT client_id
    FROM clients
    WHERE email = 'alicia.taylor@example.com'
);

SELECT
    s.session_id,
    s.scheduled_at,
    s.duration_minutes,
    s.location,
    s.status AS session_status,
    sp.status AS participant_status,
    p.package_id,
    sp.notes AS participant_notes,
    s.notes AS session_notes
FROM session_participants sp
         JOIN sessions s
              ON sp.session_id = s.session_id
         JOIN packages p
              ON sp.package_id = p.package_id
WHERE sp.client_id = @history_client_id
ORDER BY
    s.scheduled_at DESC;


-- Temporarily prove one session can support multiple clients.
-- ROLLBACK removes this test data after the result displays.
START TRANSACTION;

SET @trainer_id_for_shared_test = (
    SELECT trainer_id
    FROM trainers
    WHERE email = 'trainer@example.com'
);

SET @marcus_client_id = (
    SELECT client_id
    FROM clients
    WHERE email = 'marcus@example.com'
);

SET @marcus_package_id = (
    SELECT package_id
    FROM packages
    WHERE client_id = @marcus_client_id
    ORDER BY package_id DESC
    LIMIT 1
);

SET @alicia_client_id_for_shared_test = (
    SELECT client_id
    FROM clients
    WHERE email = 'alicia.taylor@example.com'
);

SET @alicia_package_id_for_shared_test = (
    SELECT package_id
    FROM packages
    WHERE client_id = @alicia_client_id_for_shared_test
    ORDER BY package_id DESC
    LIMIT 1
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
           @trainer_id_for_shared_test,
           DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 DAY),
           60,
           'LA Fitness',
           'scheduled',
           'Temporary shared-session support test'
       );

SET @shared_session_id = LAST_INSERT_ID();

INSERT INTO session_participants (
    session_id,
    client_id,
    package_id,
    status,
    notes
)
VALUES
    (
        @shared_session_id,
        @marcus_client_id,
        @marcus_package_id,
        'scheduled',
        'Temporary shared-session test participant'
    ),
    (
        @shared_session_id,
        @alicia_client_id_for_shared_test,
        @alicia_package_id_for_shared_test,
        'scheduled',
        'Temporary shared-session test participant'
    );

SELECT
    s.session_id,
    s.scheduled_at,
    COUNT(sp.session_participant_id) AS participant_count,
    GROUP_CONCAT(
            CONCAT(c.first_name, ' ', c.last_name)
            ORDER BY c.last_name, c.first_name
            SEPARATOR ', '
    ) AS clients_attached
FROM sessions s
         JOIN session_participants sp
              ON s.session_id = sp.session_id
         JOIN clients c
              ON sp.client_id = c.client_id
WHERE s.session_id = @shared_session_id
GROUP BY
    s.session_id,
    s.scheduled_at;

ROLLBACK;
