class Database
  getter conn : SQLite3::Database?
  setter conn : SQLite3::Database?

  getter uri : String
  setter uri : String

  def initialize(@uri)
    @conn = SQLite3::Database.new(@uri)
  end

  # FIXME Pass table_name in as a String, determine if it's a SQL query or not.
  def [](table_name : Symbol)
    Dataset.new(table_name, @conn)
  end

  def [](sql : String)
    run(sql)
  end

  def run(sql : String)
    @conn.as(SQLite3::Database).execute sql
  end
end
