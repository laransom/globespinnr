module Admin
  class UsersController < ApplicationController

    def index
      @users = User.all
    end

    def destroy
      @user = User.find(params[:id])

      if user_signed_in? and current_user.is_admin?
        @comment.destroy
        respond_to do |format|
          format.html {redirect_to admin_users_path}
        end
      else
        flash[:alert] = 'Can not delete'
        redirect_to admin_users_path
      end
    end

  end
end

