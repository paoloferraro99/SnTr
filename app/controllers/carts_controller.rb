

class CartsController < ApplicationController

  respond_to :html, :js
  
  before_action :authenticate_user!
 
  def show
    cart_ids = REDIS.smembers current_user_cart
    @cart_destinations = Destination.find(cart_ids)
  end
 
  def add
    REDIS.sadd current_user_cart, params[:destination_id]
    render json: current_user.cart_count, status: 200
  end
 
  def remove
    REDIS.srem current_user_cart, params[:destination_id]
    render json: current_user.cart_count, status: 200
  end
 
  private
 
  def current_user_cart
    "cart#{current_user.id}"
  end

end
