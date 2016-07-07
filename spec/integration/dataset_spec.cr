require "../spec_helper"

describe Dataset do
  describe "#insert" do
    it "works for a named tuple" do
      db = connect_database
      db[:users].insert({first_name: "Jonah", last_name: "George"})
      db["SELECT * FROM users"].should eq [[1, "Jonah", "George"]]
    end

    it "works for a hash" do
      db = connect_database
      db[:users].insert({:first_name => "Jonah", :last_name => "George"})
      db["SELECT * FROM users"].should eq [[1, "Jonah", "George"]]
    end
  end

  describe "#all" do
    it "returns the correct number of rows" do
      ds = connect_database[:users]

      ds.insert({first_name: "Jonah", last_name: "George"})
      ds.insert({first_name: "Paul", last_name: "George"})

      users = ds.all
      users.should eq [
        [1, "Jonah", "George"],
        [2, "Paul", "George"],
      ]
    end
  end

  describe "#where(String)" do
    it "returns the correct number of rows" do
      ds = connect_database[:users]

      ds.insert({first_name: "Jonah", last_name: "George"})
      ds.insert({first_name: "Paul", last_name: "George"})

      users = ds.where("first_name = 'Jonah'")
      users.should eq [[1, "Jonah", "George"]]
    end
  end

  describe "#where(Hash)" do
    it "works for a single condition" do
      ds = connect_database[:users]

      ds.insert({first_name: "Jonah", last_name: "George"})
      ds.insert({first_name: "Paul", last_name: "George"})

      users = ds.where({:first_name => "Jonah"})
      users.should eq [[1, "Jonah", "George"]]
    end

    it "works for multiple conditions" do
      ds = connect_database[:users]

      ds.insert({first_name: "Jonah", last_name: "George"})
      ds.insert({first_name: "Jonah", last_name: "Badden"})
      ds.insert({first_name: "Paul", last_name: "George"})

      users = ds.where({first_name: "Jonah", last_name: "George"})
      users.should eq [[1, "Jonah", "George"]]
    end
  end
end
