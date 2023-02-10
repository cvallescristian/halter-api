require "test_helper"

class CowsControllerTest < ActionDispatch::IntegrationTest

  setup do 
    @cow = cows(:one)
  end

  teardown do
    @cow.destroy!
  end

  test "should get index" do
    get cows_url
    assert_response :success 
  end

  test "should create a cow" do
    assert_difference('Cow.count') do
      post cows_url, params: { cow: { collarId: "3", cowNumber: "3" }}
    end
  
    assert_response :created
  end

  test "should update a cow" do
    patch cow_url(@cow), params: { cow: { collarId: @cow.collarId, cowNumber: @cow.cowNumber }}
  

    assert_response :ok
  end
end