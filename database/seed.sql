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
