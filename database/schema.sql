-- ================================================
-- Train Only Database Schema
-- Version: 0.1
-- Last Updated: June 2026
-- ================================================

CREATE DATABASE IF NOT EXISTS train_only_db;
USE train_only_db;

-- ================================================
-- TABLE 1: trainers
-- The root table. Everything connects back here.
-- ================================================

CREATE TABLE IF NOT EXISTS trainers (
                          trainer_id    INT          AUTO_INCREMENT PRIMARY KEY,
                          first_name    VARCHAR(50)  NOT NULL,
                          last_name     VARCHAR(50)  NOT NULL,
                          email         VARCHAR(100) NOT NULL UNIQUE,
                          password_hash VARCHAR(255) NOT NULL,
                          phone         VARCHAR(20),
                          created_at    DATETIME     DEFAULT CURRENT_TIMESTAMP
);

-- ================================================
-- TABLE 2: clients
-- Each client belongs to one trainer.
-- ================================================

CREATE TABLE IF NOT EXISTS clients (
                          client_id           INT          AUTO_INCREMENT PRIMARY KEY,
                          trainer_id          INT          NOT NULL,
                          first_name          VARCHAR(50)  NOT NULL,
                          last_name           VARCHAR(50)  NOT NULL,
                          email               VARCHAR(100) NOT NULL UNIQUE,
                          password_hash       VARCHAR(255) NOT NULL,
                          phone               VARCHAR(20),
                          date_of_birth       DATE,
                          profile_picture_url VARCHAR(255),
                          created_at          DATETIME     DEFAULT CURRENT_TIMESTAMP,

                          CONSTRAINT fk_clients_trainers
                              FOREIGN KEY (trainer_id)
                              REFERENCES trainers(trainer_id)
);
-- ================================================
-- TABLE 3: packages
-- A package is a block of sessions purchased by a client.
-- Remaining sessions will be calculated from session history.
-- ================================================

CREATE TABLE IF NOT EXISTS packages (
                                        package_id      INT            AUTO_INCREMENT PRIMARY KEY,
                                        client_id       INT            NOT NULL,
                                        sessions_total  INT            NOT NULL,
                                        purchase_date   DATE           NOT NULL,
                                        expiration_date DATE           NOT NULL,
                                        package_cost    DECIMAL(10, 2) NOT NULL,
    locked_rate     BOOLEAN        NOT NULL DEFAULT FALSE,
    status          VARCHAR(20)    NOT NULL DEFAULT 'active',
    created_at      DATETIME       DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_packages_clients
    FOREIGN KEY (client_id)
    REFERENCES clients(client_id),

    CONSTRAINT uq_packages_package_client
    UNIQUE (package_id, client_id),

    CONSTRAINT chk_packages_sessions_total
    CHECK (sessions_total > 0),

    CONSTRAINT chk_packages_cost
    CHECK (package_cost >= 0),

    CONSTRAINT chk_packages_dates
    CHECK (expiration_date >= purchase_date)
    );
-- ================================================
-- TABLE 4: sessions
-- A scheduled training event. One-on-one sessions have one participant.
-- Future small-group sessions can have multiple participants.
-- ================================================

CREATE TABLE IF NOT EXISTS sessions (
                                        session_id       INT          AUTO_INCREMENT PRIMARY KEY,
                                        trainer_id       INT          NOT NULL,
                                        scheduled_at     DATETIME     NOT NULL,
                                        duration_minutes INT          NOT NULL DEFAULT 60,
                                        location         VARCHAR(255),
    status           VARCHAR(20)  NOT NULL DEFAULT 'scheduled',
    notes            TEXT,
    created_at       DATETIME     DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_sessions_trainers
    FOREIGN KEY (trainer_id)
    REFERENCES trainers(trainer_id),

    CONSTRAINT chk_sessions_duration
    CHECK (duration_minutes > 0)
    );

-- ================================================
-- TABLE 5: session_participants
-- Connects clients and packages to a training event.
-- This lets one session support one client now or a small group later.
-- ================================================

CREATE TABLE IF NOT EXISTS session_participants (
                                        session_participant_id INT         AUTO_INCREMENT PRIMARY KEY,
                                        session_id             INT         NOT NULL,
                                        client_id              INT         NOT NULL,
                                        package_id             INT         NOT NULL,
                                        status                 VARCHAR(20) NOT NULL DEFAULT 'scheduled',
                                        notes                  TEXT,
                                        created_at             DATETIME    DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_session_participants_sessions
    FOREIGN KEY (session_id)
    REFERENCES sessions(session_id),

    CONSTRAINT fk_session_participants_clients
    FOREIGN KEY (client_id)
    REFERENCES clients(client_id),

    CONSTRAINT fk_session_participants_packages
    FOREIGN KEY (package_id, client_id)
    REFERENCES packages(package_id, client_id),

    CONSTRAINT uq_session_participants_session_client
    UNIQUE (session_id, client_id)
    );

-- ================================================
-- TABLE 6: payments
-- Tracks money received from clients for packages.
-- ================================================

CREATE TABLE IF NOT EXISTS payments (
                                        payment_id     INT            AUTO_INCREMENT PRIMARY KEY,
                                        client_id      INT            NOT NULL,
                                        package_id     INT,
                                        amount         DECIMAL(10, 2) NOT NULL,
    payment_date   DATE           NOT NULL,
    due_date       DATE,
    payment_method VARCHAR(50),
    payment_type   VARCHAR(20)    NOT NULL DEFAULT 'one_time',
    status         VARCHAR(20)    NOT NULL DEFAULT 'paid',
    notes          TEXT,
    created_at     DATETIME       DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_payments_clients
    FOREIGN KEY (client_id)
    REFERENCES clients(client_id),

    CONSTRAINT fk_payments_packages
    FOREIGN KEY (package_id)
    REFERENCES packages(package_id),

    CONSTRAINT chk_payments_amount
    CHECK (amount > 0)
    );

-- ================================================
-- TABLE 7: workout_plans
-- A lightweight weekly routine assigned to one client.
-- ================================================

CREATE TABLE IF NOT EXISTS workout_plans (
                                             plan_id           INT          AUTO_INCREMENT PRIMARY KEY,
                                             trainer_id        INT          NOT NULL,
                                             client_id         INT          NOT NULL,
                                             plan_name         VARCHAR(100) NOT NULL,
    workouts_per_week INT          NOT NULL,
    goal              TEXT,
    important_notes   TEXT,
    status            VARCHAR(20)  NOT NULL DEFAULT 'draft',
    created_at        DATETIME     DEFAULT CURRENT_TIMESTAMP,
    updated_at        DATETIME     DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_workout_plans_trainers
    FOREIGN KEY (trainer_id)
    REFERENCES trainers(trainer_id),

    CONSTRAINT fk_workout_plans_clients
    FOREIGN KEY (client_id)
    REFERENCES clients(client_id),

    CONSTRAINT chk_workout_plans_frequency
    CHECK (workouts_per_week > 0)
    );

-- ================================================
-- TABLE 8: workout_plan_days
-- Flexible routine days inside a workout plan.
-- ================================================
CREATE TABLE IF NOT EXISTS workout_plan_days (
                                                 plan_day_id   INT          AUTO_INCREMENT PRIMARY KEY,
                                                 plan_id       INT          NOT NULL,
                                                 day_number    INT          NOT NULL,
                                                 routine_focus VARCHAR(100) NOT NULL,
    details       TEXT,
    created_at    DATETIME     DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_workout_plan_days_plans
    FOREIGN KEY (plan_id)
    REFERENCES workout_plans(plan_id),

    CONSTRAINT chk_workout_plan_days_number
    CHECK (day_number > 0),

    CONSTRAINT uq_workout_plan_days_plan_day
    UNIQUE (plan_id, day_number)
    );


