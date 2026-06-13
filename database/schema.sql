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

CREATE TABLE trainers (
                          trainer_id    INT          AUTO_INCREMENT PRIMARY KEY,
                          first_name    VARCHAR(50)  NOT NULL,
                          last_name     VARCHAR(50)  NOT NULL,
                          email         VARCHAR(100) NOT NULL UNIQUE,
                          password_hash VARCHAR(255) NOT NULL,
                          phone         VARCHAR(20),
                          created_at    DATETIME     DEFAULT CURRENT_TIMESTAMP
);