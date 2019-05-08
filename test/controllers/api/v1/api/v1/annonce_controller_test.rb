require 'test_helper'

class Api::V1::Api::V1::AnnonceControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_api_v1_annonce_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_api_v1_annonce_update_url
    assert_response :success
  end

  test "should get get" do
    get api_v1_api_v1_annonce_get_url
    assert_response :success
  end

  test "should get delete" do
    get api_v1_api_v1_annonce_delete_url
    assert_response :success
  end

end
