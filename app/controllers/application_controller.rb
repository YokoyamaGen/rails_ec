# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_user

  private

  def set_user
    return if session[:user_id]

    ip_address = request.remote_ip
    browser = request.browser
    user = User.find_by(ip_address:, browser:)

    if user
      session[:user_id] = user.id
      return
    end

    new_user = User.create!(ip_address:, browser:)
    session[:user_id] = new_user.id
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
