class Dataset
  getter conn : SQLite3::Database?
  setter conn : SQLite3::Database?

  getter table_name : Symbol
  setter table_name : Symbol

  def initialize(@table_name, @conn = nil)
  end

  def all_sql
    "SELECT * FROM #{@table_name}"
  end

  def all
    execute all_sql
  end

  def insert_sql(args)
    columns = args.keys.join(',')
    values = args.values.map { |v| escape(v) }.join(',')

    "INSERT INTO #{@table_name} (#{columns}) VALUES (#{values})"
  end

  def insert(args)
    execute insert_sql(args)
  end

  def where_sql(args)
    all_sql + " WHERE " + args
  end

  def where(args : String)
    execute where_sql(args)
  end

  def where(args : Hash | NamedTuple)
    conditions = args.to_a
                     .map { |(k, v)| {k, escape(v)} }
                     .map { |(k, v)| "#{k} = #{v}" }
                     .join(" AND ")

    execute where_sql(conditions)
  end

  private def execute(sql : String)
    @conn.as(SQLite3::Database).execute sql
  end

  private def escape(value)
    value
  end

  private def escape(value : String)
    value = value.gsub("'", "''")
    "'" + value + "'"
  end
end
