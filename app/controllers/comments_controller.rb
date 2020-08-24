class CommentsController < ApplicationController

  def create
      @art = Art.find params[:art_id]
      @comment = Comment.new comment_params
      @comment.art = @art
      @comment.user = current_user
      if @comment.save
          redirect_to art_path(@art)
      else
          @comments = @art.comments.order(created_at: :desc)
          render 'arts/show'
      end
  end

  def destroy
      @comment = Comment.find params[:id]
      if can?(:crud, @comment)
      @comment.destroy
      redirect_to art_path(@comment.art)
    else
         head :unauthorized     
     end
  end

  private

  def comment_params
      params.require(:comment).permit(:body)
  end
end
