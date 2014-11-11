class Users::CampusharesController < Users::ApplicationController
  def index
    @topics = @user.campushares.includes(:category).order(id: :desc).page(params[:page])
  end

  def likes
    @topics = @user.like_campushares.includes(:category, :user).order(id: :desc).page(params[:page])
    render :index
  end
end
