require 'test_helper'

class CorrectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get corrections_new_url
    assert_response :success
  end

  test "should get create" do
    get corrections_create_url
    assert_response :success
  end

end
