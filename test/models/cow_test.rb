require "test_helper"

class CowTest < ActiveSupport::TestCase

  test "CollarId uniqueness validation should trigger" do
    @cow1 = cows(:one)
  
    assert_not Cow.new(collarId: @cow1.collarId, cowNumber: "another-cow-number").save 
  end

  test "CowNumber uniqueness validation should trigger" do
    @cow1 = cows(:one)
  
    assert_not Cow.new(collarId: "another-collar-id", cowNumber: @cow1.cowNumber).save 
  end

  test "Cow should save" do
    @cow1 = cows(:one)
    assert Cow.new(collarId: "another-collar-id", cowNumber: "another-cow-number").save 
  end
  
end
