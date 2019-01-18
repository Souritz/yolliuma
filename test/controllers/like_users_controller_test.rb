require 'test_helper'

class LikeUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get like_users_create_url
    assert_response :success
  end

  test "should get destroy" do
    get like_users_destroy_url
    assert_response :success
  end

end
