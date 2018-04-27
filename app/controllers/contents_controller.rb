class ContentsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @contents = @user.contents.page(params[:page]).per(4)
  end

  def random
    rndm = rand(1..Content.count)
    @content = Content.find(rndm)
    @comment = Comment.new
    @comments = @content.comments.page(params[:page]).per(4)
    render 'show'
  end

  def top
    @contents = Content.unscoped.all.order!(cached_weighted_score: :desc).page(params[:page]).per(4)
  end

  def show
    @content = Content.find(params[:id])
    @comment = Comment.new
    @comments = @content.comments.page(params[:page]).per(8)
  end

  def create
    @content = current_user.contents.build(content_params)
    if @content.save
      # Handle a successful save.
      redirect_to @content
    else
      @user = current_user
      @content = Content.new(:user=>@user)
      render 'new'
    end
  end

  def new
    @user = current_user
    @content = Content.new(:user=>@user)
  end

  def destroy
    Content.find(params[:id]).destroy
    flash[:success] = "Content deleted"
    redirect_to index_url
  end

  private

    def content_params
      params.require(:content).permit(:name, :desc, :picture)
    end
end
