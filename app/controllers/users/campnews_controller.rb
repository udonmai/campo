class Users::CampnewsController < Users::ApplicationController
  def index
    @topics = @user.campnews.includes(:category).order(id: :desc).page(params[:page])
  end

  def likes
    @topics = @user.like_campnews.includes(:category, :user).order(id: :desc).page(params[:page])
    render :index
  end
end
