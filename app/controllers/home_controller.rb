class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    set_access_token_in_cookies
    redirect_to 'http://localhost:3000/api/v1/todos'
  end

  private

  def set_access_token_in_cookies
    cookies[:userEmail] = {
      value: current_user.email,
      expires: 1.year.from_now,
      domain: request.domain
    }

    cookies[:userToken] = {
      value: current_user.authentication_token,
      expires: 1.year.from_now,
      domain: request.domain
    }
  end
end
