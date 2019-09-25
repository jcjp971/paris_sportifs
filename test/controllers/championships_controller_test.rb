require 'test_helper'

class ChampionshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get championships_index_url
    assert_response :success
  end

end
