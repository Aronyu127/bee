class BaseController < ApplicationController

  def index
    @products = Product.all
  end
end
