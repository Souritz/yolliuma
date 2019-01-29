require 'test_helper'

class LikeIllustrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get like_illustrations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get like_illustrations_destroy_url
    assert_response :success
  end

end
