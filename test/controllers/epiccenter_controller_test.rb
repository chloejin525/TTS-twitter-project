require 'test_helper'

class EpiccenterControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get epiccenter_feed_url
    assert_response :success
  end

  test "should get show_user" do
    get epiccenter_show_user_url
    assert_response :success
  end

  test "should get now_following" do
    get epiccenter_now_following_url
    assert_response :success
  end

  test "should get unfollow" do
    get epiccenter_unfollow_url
    assert_response :success
  end

end
