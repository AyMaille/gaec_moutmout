class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @sheep = Sheep.find(params[:sheep_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @sheep = Sheep.find(params[:sheep_id])
    @comment.sheep = @sheep
    @comment.user_name = current_user.name
    if @comment.save!
      redirect_to sheep_path(@sheep)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
