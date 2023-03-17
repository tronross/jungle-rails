class AdminController < ApplicationController
  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Admin') do |username, password|username == process.env.ADMIN_USERNAME, password == process.env.ADMIN_PASSWORD
  end
end

  def products
  end

  def show
  end
end