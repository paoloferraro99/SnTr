class SubscriptionsController < ApplicationController

  # before_filter :authenticate_user!

  def index
  end

  def show
    @subscription = Subscription.find(params[:id])
    @destinations = @subscription.destinations
  end

  def new
    @subscription = Subscription.new
  end

  def create 
    @subscription = current_user.subscriptions.build(subscription_params)

    # dest = Destination.find_by_chronological_order(1)
    # @subscription.add_destination(dest)

    if @subscription.save

      ####################################################################
        # arr = [Destination.all.cronological_order]
          # {destination: :chronological_order, ...}

        #       ---start with first
        # dest_list = arr.select { |a| a <= @subscription.months_subscribed}

        #       ---with specific start_destination
        # dest_list = arr.select { |a| start_dest.chronological_order <= a <= (start_dest.chronolical_order + @subscription.months_subscribed)}
      #####################################################################

      starting_position = 0

      # if self.start_destination.present?
      #   starting_postion = Destination.where(:name => self.start_destination).first.chronological_order
      # end
      
      months = @subscription.months_subscribed
      dest_list = Destination.where("chronological_order >= ?", starting_position).order(chronological_order: :asc).limit(months)
##############################################################################
      # x = @subscription.months_subscribed
      # dest_list = Destination.where(chronological_order: 2..5)

      dest_list.each do |dest|
        @subscription.add_destination(dest)
      end


      # dest = Destination.find_by_chronological_order(@subscription.months_subscribed - 1)
      # # dest = Destination.where(chronological_order: 2..5)
      # @subscription.add_destination(dest)
      flash[:notice] = "Subscription saved."
      redirect_to new_subscribe_path
    else
      flash[:error] = "Error saving subscription. Try again."
      render :new
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    name = @subscription.name


    
    if @subscription.destroy
      flash[:notice] = "\"#{name}\" has been deleted."
      redirect_to current_user
    else
      flash[:error] = "Error deleting subscriptions."
      render :show
    end

  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :primary, :months_subscribed, :start_destination)
  end

end
