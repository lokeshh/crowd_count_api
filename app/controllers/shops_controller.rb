class ShopsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    render json: Shop.all
  end
  
  def show_count
    
    @shop = Shop.find(params[:id])
    render json: @shop
  end
  
  def update_count
    @shop = Shop.find(params[:id])
    file = "#{Rails.root}/python/pic.jpeg"
    png = Base64.decode64(params[:data])
    File.open(file, 'wb') { |f| f << png }
    count = `python python/count.py -i python/pic.jpeg`
    @shop.count = count
    @shop.save!
    if File.exist?(file)
      render :json => {
        :success => true
      }
    else
      render :json => {
        :success => false,
        :message => 'something went wrong when saving ' + file
      }
    end
  end
end
