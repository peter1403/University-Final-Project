class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    content = Content.find(params[:content_id])
    @comment = content.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment added"
      redirect_to "/contents/#{content.id}"
    else
      redirect_to "/contents/#{content.id}"
    end

  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content_text)
  end
end
