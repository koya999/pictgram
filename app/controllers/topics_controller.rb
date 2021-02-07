class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.includes(:favorite_users)
    # 確認テスト
    @comment = Comment.new
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    # @topic = Topic.new(topic_params.merge(user_id: current_user.id))
    @topic = current_user.topics.new(topic_params)
     
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  # 確認テスト
  def show
    @topic = Topic.find_by(params[:id])
    @comments = @topic.comments.includes(:user)
    @comment = @topic.comments.build(user_id: current_user.id) if current_user
  end  

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
  
end