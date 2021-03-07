CREATE TABLE IF NOT EXISTS general_fees {
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    fee_type VARCHAR NOT NULL,
    cost INTEGER NOT NULL,
}