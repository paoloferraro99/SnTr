class DestinationsController < ApplicationController

  respond_to :html, :js

  def index
    @destinations = Destination.all

  end
  
  def show
    @destination = Destination.find(params[:id])

    # for cart
    @cart_action = @destination.cart_action current_user.try :id
    #

  end
  
  def new
    @destination = Destination.new

  end
  
  def create
    @destination = Destination.new(destination_params)


    if @destination.save
      flash[:notice] = "Destination saved."
      redirect_to @destination
      else
      flash[:error] = "Error saving destination."
      render :new
    end
  end
  
  def edit
    @destination = Destination.find(params[:id])

  end
  
  def update
    @destination = Destination.find(params[:id])


    if @destination.update_attributes(destination_params)
      flash[:notice] = "Destination updated."
      redirect_to @destination
    else
      flash[:error] = "Error updating destination."
      render :edit
     end
   end

    def destroy
      @destination = Destination.find(params[:id])
      if @destination.destroy
        flash[:notice] = "Destination deleted." 
      else
        flash[:error] = 'Error deleting destination.' 
      end
      redirect_to destinations_path
    end

   private 

    def destination_params
      params.require(:destination).permit(:name,:region,:country,:released,:individual_price,:chronological_order,:created_at,:updated_at)
   end


end
