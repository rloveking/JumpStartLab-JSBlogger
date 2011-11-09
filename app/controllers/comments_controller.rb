class CommentsController < ApplicationController
  def index
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.save!
    redirect_to article_path(@comment.article)
  end

  def destroy
  end

end
