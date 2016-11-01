class SessionsController < ApplicationController
  before_action :set_user

  def create
    @user.update(email: auth_hash['info']['email'] || Faker::Internet.email)
    sign_in @user
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find_or_initialize_by(provider: auth_hash['provider'], provider_id: auth_hash['uid'])
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end