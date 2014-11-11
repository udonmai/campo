class Admin::CampnewsController < Admin::ApplicationController
  before_action :find_topic, only: [:show, :update, :trash, :restore]

  def index
    @topics = Campnew.includes(:user).order(id: :desc).page(params[:page])
  end

  def trashed
    @topics = Campnew.trashed.includes(:user).order(id: :desc).page(params[:page])
    render :index
  end

  def show
  end

  def update
    if @topic.update_attributes params.require(:campnew).permit(:title, :category_id, :body)
      flash[:success] = I18n.t('admin.campnews.flashes.successfully_updated')
      redirect_to admin_campnew_path(@topic)
    else
      render :show
    end
  end

  def trash
    @topic.trash
    flash[:success] = I18n.t('admin.campnews.flashes.successfully_trashed')
    redirect_to admin_campnew_path(@topic)
  end

  def restore
    @topic.restore
    flash[:success] = I18n.t('admin.campnews.flashes.successfully_restored')
    redirect_to admin_campnew_path(@topic)
  end

  private

  def find_topic
    @topic = Campnew.with_trashed.find params[:id]
  end
end
