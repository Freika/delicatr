require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get add_blog" do
    get :add_blog
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
