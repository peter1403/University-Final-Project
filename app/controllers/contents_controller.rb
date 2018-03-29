class ContentsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @contents = @user.contents.paginate(page: params[:page], :per_page => 3)
  end

  def show
    @content = Content.find(params[:id])
  end

  def create
    @content = current_user.contents.build(content_params)
    if @content.save
      # Handle a successful save.
      redirect_to @content
    else
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
      params.require(:content).permit(:name, :desc)
    end
end
