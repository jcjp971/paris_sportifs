require 'test_helper'

class PronoSitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prono_sites_index_url
    assert_response :success
  end

  test "should get edit" do
    get prono_sites_edit_url
    assert_response :success
  end

  test "should get update" do
    get prono_sites_update_url
    assert_response :success
  end

end
