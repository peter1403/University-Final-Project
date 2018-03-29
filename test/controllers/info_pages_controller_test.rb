require 'test_helper'

class InfoPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get siteInfo" do
    get info_pages_siteInfo_url
    assert_response :success
  end

  test "should get about" do
    get info_pages_about_url
    assert_response :success
  end

  test "should get help" do
    get info_pages_help_url
    assert_response :success
  end

  test "should get siteRules" do
    get info_pages_siteRules_url
    assert_response :success
  end

end
