class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @topic = Topic.find(params[:topic_id])
  end
  
 def create
    @comment =Comment.new(comment_params)
    @comment.user_id = current_user.id

    if comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメントの登録に失敗しました'
    end
 end
 
 private
 def comment_params
   params.require(:comment).permit(:content, :topic_id)
 end 
end 