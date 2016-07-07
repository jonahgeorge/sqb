require "uri"
require "sqlite3"

require "./database"
require "./dataset"

class Sequel
  def self.connect(str : String, args = nil)
    uri = URI.parse str
    if uri.scheme == "sqlite"
      Database.new(uri.host.as(String))
    else
      raise "Unsupported database"
    end
  end
end
