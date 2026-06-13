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
