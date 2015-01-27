class UsersController < ApplicationController

  def show

    @user = User.find(params[:id])
    @subscriptions = @user.subscriptions

  end

end
