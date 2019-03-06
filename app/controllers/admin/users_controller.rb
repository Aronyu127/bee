module Admin
  class UsersController < BaseController
    before_action :user, only: :update

    def index
      @users = User.all.order('id DESC').page(params[:page]).per(30)
    end

    def update
      if user.update(user_params)
        redirect_to admin_users_path, flash: { success: 'update success' }
      else
        flash.now[:error] = user.errors.full_messages
        render :index
      end
    end

    private

    def user
      @user ||= params[:id] ? User.find(params[:id]) : User.new(user_params)
    end

    def user_params
      params.fetch(:user, {}).permit(:admin)
    end
  end
end
