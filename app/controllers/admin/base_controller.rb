module Admin
  class BaseController < ::ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :authenticate_admin_user!

    def index; end

    private

    def authenticate_admin_user!
      redirect_to root_path unless current_user.admin
    end
  end
end
