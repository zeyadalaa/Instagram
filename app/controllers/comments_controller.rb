class CommentsController < ApplicationController
  def create
    @pic = Pic.find(params[:pic_id])
    @comment = @pic.comments.create(comment_params)
    @comment.commenter = current_user.email
    redirect_to pic_path(@pic)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter,:body)
    end
end
