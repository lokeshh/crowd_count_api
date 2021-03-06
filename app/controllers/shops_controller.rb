class ShopsController < ApplicationController
  protect_from_forgery with: :null_session
  
  def index
    @shops = Shop.all
    respond_to do |format|
      format.html
      format.json { render json: @shops }
    end    
  end
  
  def show_count
    @shop = Shop.find(params[:id])
    respond_to do |format|

      format.html
      format.json { render json: @shop }

    end
  end
  
  def update_count
    @shop = Shop.find(params[:id])
    file = "#{Rails.root}/python/mcnn/data/frames/pic.jpeg"
    png = Base64.decode64(params[:data])
    File.open(file, 'wb') { |f| f << png }
    count = `python python/mcnn/test.py`
    p count
    @shop.count = count
    @shop.save
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
