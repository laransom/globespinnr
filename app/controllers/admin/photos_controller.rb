module Admin
  class PhotosController < ApplicationController

    def index
      @photos = Photo.all.page(params[:page]).per(50)
    end

    def destroy
      @photo= Photo.find(params[:id])

      if user_signed_in? and current_user.is_admin?
        @photo.destroy
        respond_to do |format|
          format.html {redirect_to admin_photos_path}
        end
      else
        flash[:alert] = 'Can not delete'
        redirect_to admin_photos_path
      end
    end

  end
end

