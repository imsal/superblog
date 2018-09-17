require 'test_helper'

class DisplayControllerTest < ActionDispatch::IntegrationTest
  test "should get category" do
    get display_category_url
    assert_response :success
  end

  test "should get post" do
    get display_post_url
    assert_response :success
  end

end
