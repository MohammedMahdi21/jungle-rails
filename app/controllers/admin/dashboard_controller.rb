class Admin::DashboardController < ApplicationController
  def show
    @category = Category.count(:all)
    @products = Product.count(:all)
  end
end
