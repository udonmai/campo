class Admin::SystemessagesController < Admin::ApplicationController
  before_action :find_topic, only: [:show, :update, :trash, :restore]

  def index
    @topics = Systemessage.order(id: :desc).page(params[:page])
  end

  def trashed
    @topics = Systemessage.trashed.order(id: :desc).page(params[:page])
    render :index
  end

  def show
  end

  def new
    #@category = Category.where('lower(slug) = ?', params[:category_id].downcase).first if params[:category_id].present?
    @topic = Systemessage.new #category: @category
  end

  def create
    @topic = Systemessage.new systemessage_params
    if @topic.save
      Resque.enqueue(SystemessageNotificationJob, @topic.id)
    end
  end

  def update
    if @topic.update_attributes params.require(:systemessage).permit(:title, :category_id, :body)
      flash[:success] = I18n.t('admin.systemessages.flashes.successfully_updated')
      redirect_to admin_systemessage_path(@topic)
    else
      render :show
    end
  end

  def trash
    @topic.trash
    flash[:success] = I18n.t('admin.systemessages.flashes.successfully_trashed')
    redirect_to admin_systemessage_path(@topic)
  end

  def restore
    @topic.restore
    flash[:success] = I18n.t('admin.systemessages.flashes.successfully_restored')
    redirect_to admin_systemessage_path(@topic)
  end

  private

  def find_topic
    @topic = Systemessage.with_trashed.find params[:id]
  end

  def systemessage_params
    params.require(:systemessage).permit(:title, :body)
  end
end
