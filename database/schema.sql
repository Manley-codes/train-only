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
    REFERENCES clients(client_id)
    );
-- ================================================
-- TABLE 4: sessions
-- A scheduled training appointment for one client.
-- Completed sessions will be used to calculate remaining package sessions.
-- ================================================

CREATE TABLE IF NOT EXISTS sessions (
                                        session_id       INT          AUTO_INCREMENT PRIMARY KEY,
                                        client_id        INT          NOT NULL,
                                        package_id       INT          NOT NULL,
                                        scheduled_at     DATETIME     NOT NULL,
                                        duration_minutes INT          NOT NULL DEFAULT 60,
                                        location         VARCHAR(255),
    status           VARCHAR(20)  NOT NULL DEFAULT 'scheduled',
    notes            TEXT,
    created_at       DATETIME     DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_sessions_clients
    FOREIGN KEY (client_id)
    REFERENCES clients(client_id),

    CONSTRAINT fk_sessions_packages
    FOREIGN KEY (package_id)
    REFERENCES packages(package_id)
    );

-- ================================================
-- TABLE 5: payments
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
    REFERENCES packages(package_id)
    );