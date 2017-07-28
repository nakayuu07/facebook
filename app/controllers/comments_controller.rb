class CommentsController < ApplicationController
  def create
      # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
      @comment = current_user.comments.build(comment_params)
      @topic = @comment.topic
      # クライアント要求に応じてフォーマットを変更
      respond_to do |format|
        if @comment.save
          format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
          format.js { render :index }
        else
          format.html { render :new }
        end
      end
    end

   def destroy
       @comment = Comment.find(params[:id])
       @topic = @comment.topic
       @comment.destroy
       respond_to do |format|
       format.html { redirect_to topic_path(@topic) }
       format.js { render :index }
     end
   end

    private
      # ストロングパラメーター
      def comment_params
        params.require(:comment).permit(:topic_id, :content)
      end
end
