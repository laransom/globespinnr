module Admin
  class CommentsController < ApplicationController


    def index
      @comments = Comment.all
    end

    def destroy
      @comment = Comment.find(params[:id])

      if user_signed_in? and current_user.is_admin?
        @comment.destroy
        respond_to do |format|
          format.html {redirect_to admin_comments_path}
        end
      else
        flash[:alert] = 'Can not delete'
        redirect_to admin_comments_path
      end
    end

  end
end


