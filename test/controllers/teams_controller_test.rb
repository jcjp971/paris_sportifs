require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teams_index_url
    assert_response :success
  end

  test "should get edit" do
    get teams_edit_url
    assert_response :success
  end

  test "should get update" do
    get teams_update_url
    assert_response :success
  end

end
