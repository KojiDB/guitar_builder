class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destory, :create]
  before_action :authenticate_builder!, only: [:new, :edit, :update, :destroy, :create]

  def index
    @comment = Comment.all.order(id: 'DESC')
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to 
    else
      @guitar = @comment.guitar
      @comments = @guitar.comments.includes(:builder)
      render
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, builder_id: current_builder.id, guitar_id: params[:guitar_id])
  end
end
