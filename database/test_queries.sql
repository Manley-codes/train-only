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