require "./spec_helper"

describe Database do
  describe "#[](Symbol)" do
    db = Sequel.connect("sqlite://data.db")
    assert { typeof(db[:users]) == Database }
  end
end
