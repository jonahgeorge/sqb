# SQB: Shitty Query Builder


```crystal
require "../src/sequel"

DB = Sequel.connect("sqlite://data.db")
users = DB[:users]

puts users.all.to_sql
puts users.all

puts users.where("name = 'Jonah'").to_sql
puts users.where("name = 'Jonah'")
```
