class UsersController < BaseController
  before_action :authenticate_user!

  def upgrade
    if current_user.extend_vip
      flash[:success] = 'upgrade success'
    else
      flash[:error] = current_user.errors.full_messages
    end
    redirect_to root_path
  end

end
