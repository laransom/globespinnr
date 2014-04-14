class PhotosController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create]

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @location = Location.find(params[:location_id])
  end

  def create
    binding.pry
    @location = Location.find(params[:photo][:location_id])
    @photo = @location.photos.build(photo_params)
    @photo.user = current_user

    if @photo.save
      redirect_to location_path(@location), notice: 'Photo successfully added'
    else
      flash[:notice] = 'Upload unsuccessful'
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html {redirect_to photos_path }
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:description, :location_id, :image)
  end

end
