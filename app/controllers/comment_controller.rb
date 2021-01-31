class CommentsController < ApplicationController
   def index
    @comment_topics = current_user.comment_topics
   end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]

    if comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメントの登録に失敗しました'
    end
  end
  
  def destroy
    comment = Comment.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    comment.destroy if comment.present?
    
    if comment.destroyed?
      redirect_to topics_path, success: 'お気に入りを削除しました'
    else
      redirect_to topics_path, danger: 'お気に入りの削除に失敗しました'
    end 
  end 
end