class SubscriptionsController < ApplicationController

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
      flash[:notice] = "Subscription saved."

      #  number of months to choose destinations in sequence?
      # number of months
      # ary + chron order of first dest to find starting point
      # arr.select { |a| a > months subbed > (starting point + months subbed }
        # @subscription.start_destination.chron_order
        # block for start destination test selection button

      dest = Destination.find_by_chronological_order(@subscription.months_subscribed - 1)
      @subscription.add_destination(dest)

      redirect_to @subscription
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
