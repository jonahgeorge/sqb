require "spec"
require "../src/sequel"

describe Dataset do
  describe "#all_sql" do
    it "should return the correct sql" do
      users = Dataset.new(:users)
      sql = users.all_sql
      sql.should eq("SELECT * FROM users")
    end
  end

  describe "#where(String)" do
    it "should return the correct sql" do
      users = Dataset.new(:users)
      sql = users.where_sql("name = 'Jonah'")
      sql.should eq("SELECT * FROM users WHERE name = 'Jonah'")
    end
  end

  describe "#insert(Hash)" do
    it "produces the correct sql" do
      users = Dataset.new(:users)
      sql = users.insert_sql({:name => "Jonah", :age => 22})
      sql.should eq("INSERT INTO users (name,age) VALUES ('Jonah',22)")
    end
  end
end
