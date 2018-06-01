class TopicsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_topic, only:[:edit,:update,:destroy,:show ,:read, :unread]



  def index
    @topics = Topic.all
  end

  def new
    if params[:back]
     @topic = Topic.new(topics_params)
    else
     @topic = Topic.new
    end
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
     redirect_to topics_path, notice:"トピックを作成しました！"
     NoticeMailer.sendmail_topic(@topic).deliver
    else
     render 'new'
   end
  end

  def edit
  end

  def update
    if @topic.update(topics_params)
      redirect_to topics_path,notice:"トピックを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    if @topic.destroy
       redirect_to topics_path,notice:"トピックを削除しました！"
    else
       redirect_to root_path
    end
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  def confirm
    @topic = Topic.new(topics_params)
    render :new if @topic.invalid?
  end

  def read
    @topic.update(read: true)
    redirect_to topics_path
  end

  def unread
    @topic.update(read: false)
    redirect_to topics_path
  end

  private
   def topics_params
     params.require(:topic).permit(:title, :content, :read)
   end

   def set_topic
     @topic = Topic.find(params[:id])
   end
end
