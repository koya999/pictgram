class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id
    respond_to do |format|
      format.html
    end 
  end
  
 def create
    @comment =Comment.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメントの登録に失敗しました'
    end
 end
 
 private
 def comment_params
   params.require(:comment).permit(:content, :topic_id, :user_id)
 end 
end