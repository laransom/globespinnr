class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create]

  def new
    if params[:location_id] == nil
      @comment = Comment.new
      @photo = Photo.find(params[:photo_id])
    else
      @comment = Comment.new
      @location = Location.find(params[:location_id])
    end
  end

  def create
    if params[:location_id] == nil
      @photo = Photo.find(params[:photo_id])
      @comment = @photo.comments.build(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to photo_path(@photo), notice: 'Comment Added'
      else
        render :new
      end

    else
      @location = Location.find(params[:location_id])
      @comment = @location.comments.build(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to location_path(@location), notice: 'Comment Added'
      else
        render :new
      end
    end
  end

  protected
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end

end
