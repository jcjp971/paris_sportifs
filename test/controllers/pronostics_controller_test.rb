require 'test_helper'

class PronosticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pronostics_index_url
    assert_response :success
  end

end
