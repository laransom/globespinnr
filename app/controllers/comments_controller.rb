class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create]

  def new
    @comment = Comment.new
    @photo = Photo.find(params[:photo_id])
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to photo_path(@photo), notice: 'Comment Added'
    else
      render :new
    end
  end

  protected
  def comment_params
    params.require(:comment).permit(:body, :commentable_id)
  end

end
