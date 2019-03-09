module RequestHelper
  def signout_user
    delete '/users/sign_out'
    @current_user = nil
  end

  def signin_user(user = nil, admin: false)
    user ||= admin ? create(:user, :admin) : create(:user)
    post '/users/sign_in', params: { user: { email: user.email, password: user.password } }
    @current_user = user if response.status == 302
  end

  def signin_vip_user(user = nil, admin: false)
    user ||= admin ? create(:user, :admin, :vip) : create(:user, :vip)
    post '/users/sign_in', params: { user: { email: user.email, password: user.password } }
    @current_user = user if response.status == 302
  end

  def current_user
    @current_user
  end
end
