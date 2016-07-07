require "./spec_helper"

describe Sequel do
  describe "#connect" do
    it "returns a Database for Sqlite" do
      db = Sequel.connect("sqlite://data.db")
      assert { typeof(db) == Database }
    end

    it "raises an Exception for Postgres" do
      expect_raises { Sequel.connect("postgres://user:password@localhost/db") }
    end
  end

  describe "end-to-end" do
    it "can query users" do
      db = Sequel.connect("sqlite://data.db")
      assert { typeof(db) == Database }
    end
  end
end
