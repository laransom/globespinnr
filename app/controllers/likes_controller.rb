class LikesController < ApplicationController

  before_filter :authenticate_user!, only: [:create, :new]

  def create
    @like ||= Like.new(like_params)
    @like.user = current_user

    if @like.save
      redirect_to photo_path(@like.photo), notice: 'Liked'
    else
      redirect_to photo_path(@like.photo), alert: 'Already liked'
    end

  end

  protected
  def like_params
    params.require(:like).permit(:score, :photo_id)
  end

end
