require 'test_helper'

class VotingsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(username: "example123", password: "foobar",
      description: "This is an example description")

    @content = Content.new!(name: "exampleImage" desc: "exampleDesc", )
  end

  test "upvote correct" do
    @content.upvote_by @user
    assert @content.weighted_score == 1
  end

  test "downvote correct" do
    @content.upvote_by @user
    assert @content.weighted_score == -1
  end
end
