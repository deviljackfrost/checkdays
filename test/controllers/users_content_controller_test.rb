require "test_helper"

class UsersContentControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get users_content_mypage_url
    assert_response :success
  end

  test "should get show" do
    get users_content_show_url
    assert_response :success
  end

  test "should get create" do
    get users_content_create_url
    assert_response :success
  end

  test "should get edit" do
    get users_content_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_content_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_content_destroy_url
    assert_response :success
  end
end
