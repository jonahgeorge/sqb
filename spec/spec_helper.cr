require "spec"
require "../src/sequel"

def connect_database
  db = Sequel.connect("sqlite://data.db")
  drop_database(db)
  create_database(db)
  db
end

def create_database(db)
  sql = <<-SQL
  CREATE TABLE users (
    id INTEGER,
    first_name TEXT,
    last_name TEXT,
    PRIMARY KEY (id)
  );
  SQL
  db[sql]
end

def drop_database(db)
  db["DROP TABLE users"]
end
