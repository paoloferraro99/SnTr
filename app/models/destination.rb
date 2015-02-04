

class Destination < ActiveRecord::Base

  def users
  end

  # for cart
  def cart_action(current_user_id)
    if REDIS.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
  #

end
