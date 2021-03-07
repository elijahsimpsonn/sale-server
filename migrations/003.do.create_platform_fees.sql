
CREATE TABLE IF NOT EXISTS platform_fees (
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    platform_id INTEGER NOT NULL REFERENCES platforms(platform_id),
    fee_type VARCHAR NOT NULL,
    cost DECIMAL(19, 4) NOT NULL
);