CREATE TABLE IF NOT EXISTS deaditems {
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    total INTEGER NOT NULL,
    date_created TIMESTAMPTZ DEFAULT now(),
    cost INTEGER NOT NULL
}