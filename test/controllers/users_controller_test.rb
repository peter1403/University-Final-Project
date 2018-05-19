require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(username: "example123", password: "",
      description: "This is an example description")
  end

  test "should be invalid" do
    assert_not @user.valid?
  end

  test "password invalid" do
    assert_not @user.password.valid?
  end
end
