class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
  end

  def initialize
    @products_total = Product.count
    @categories_total = Category.count
    puts @products_total
    puts @categories_total
  end

end
