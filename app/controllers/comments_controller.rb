class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.comment != ''
	    @comment.save
	  end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Your comment has been deleted."
    redirect_to :back
  end
end