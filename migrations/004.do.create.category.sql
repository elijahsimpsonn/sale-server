CREATE TABLE IF NOT EXISTS category {
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    category_id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    category_name VARCHAR NOT NULL
}