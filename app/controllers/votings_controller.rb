class VotingsController < ApplicationController

  def upvote
    @content = Content.find(params[:id])
    @content.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to content_url(@content) }
      format.js
    end
  end

  def downvote
    @content = Content.find(params[:id])
    @content.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to content_url(@content) }
      format.js
    end
  end
end
