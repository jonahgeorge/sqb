require "../spec_helper"

describe Database do
  context "#[](Symbol)" do
    it "returns a dataset" do
      db = connect_database
      typeof(db[:users]).should eq(Dataset)
    end
  end

  context "#run(String)" do
    db = connect_database
    db.run("INSERT INTO users (first_name,last_name) VALUES ('Jonah','George')")
    db.run("SELECT * FROM users").should eq [[1, "Jonah", "George"]]
  end

  context "#[](String)" do
    it "executes a sql query" do
      db = connect_database
      db["INSERT INTO users (first_name,last_name) VALUES ('Jonah','George')"]
      db["SELECT * FROM users"].should eq [[1, "Jonah", "George"]]
    end
  end
end
