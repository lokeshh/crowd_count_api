class ShopsController < ApplicationController
  def index
    render json: Shop.all
  end
  
  def show_count
    @shop = Shop.find(params[:id])
    render json: @shop
  end
end
