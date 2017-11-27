require 'test_helper'

class WaitTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wait_time = wait_times(:one)
  end

  test "should get index" do
    get wait_times_url, as: :json
    assert_response :success
  end

  test "should create wait_time" do
    assert_difference('WaitTime.count') do
      post wait_times_url, params: { wait_time: { store_id: @wait_time.store_id, user_id: @wait_time.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show wait_time" do
    get wait_time_url(@wait_time), as: :json
    assert_response :success
  end

  test "should update wait_time" do
    patch wait_time_url(@wait_time), params: { wait_time: { store_id: @wait_time.store_id, user_id: @wait_time.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy wait_time" do
    assert_difference('WaitTime.count', -1) do
      delete wait_time_url(@wait_time), as: :json
    end

    assert_response 204
  end
end
