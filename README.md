# SQB: Shitty Query Builder

Please don't use this.

```crystal
require "../src/sequel"

DB = Sequel.connect("sqlite://data.db")
DB.run <<-SQL
CREATE TABLE IF NOT EXISTS users (
  id INTEGER,
  first_name TEXT,
  last_name TEXT,
  PRIMARY KEY (id)
);
SQL

users = DB[:users]

users.insert({first_name: "Jonah", last_name: "George"})
users.insert({first_name: "Kathrine", last_name: "Gifford"})

puts users.all
puts users.where({first_name: "Jonah"})
```
