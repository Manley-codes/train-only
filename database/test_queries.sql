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
         LEFT JOIN sessions s
                   ON p.package_id = s.package_id
                       AND s.status = 'completed'
WHERE p.status = 'active'
GROUP BY
    c.client_id,
    c.first_name,
    c.last_name,
    p.package_id,
    p.sessions_total;

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