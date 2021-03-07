CREATE TABLE IF NOT EXISTS shipping_supplies {
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    supply_name VARCHAR NOT NULL,
    supply_type VARCHAR NOT NULL,
    size VARCHAR NOT NULL,
}