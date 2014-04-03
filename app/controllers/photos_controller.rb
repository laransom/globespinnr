class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path, notice: 'Photo successfully added'
    else
      flash[:notice] = 'Upload unsuccessful'
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:description, :location, :image)
  end

end
