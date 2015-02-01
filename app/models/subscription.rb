class Subscription < ActiveRecord::Base

  belongs_to :user

  ################################################################
  # def self.subscription_to_destinations_key(user_id)
  #   "subscription_to_destinations_key:#{self.id.to_s}"
  # end

  # def subscription_to_destinations_key
  #   User.subscription_to_destinations_key(self.id)
  # end
  # #######################################################
  # def self.destination_to_users_key(destination_id)
  #   "destination_to_users_key:#{dest.id.to_s}"
  # end

  # def destination_to_users_key
  #   Destination.destination_to_users_key(self.id)
  # end
  #################################################################


  def add_destination(dest)
    REDIS.sadd "subscription_to_destinations_key:#{self.id.to_s}", dest.id.to_s
    REDIS.sadd "destination_to_subscriptions_key:#{dest.id.to_s}", self.id.to_s
    ######################################################
    # REDIS.sadd self.subscription_to_destinations_key, dest.id.to_s
    # REDIS.sadd dest.destination_to_subscriptions_key, self.id.to_s
  end

  def rem_destination(dest)
    REDIS.srem "subscription_to_destinations_key:#{self.id.to_s}", dest.id.to_s
    REDIS.srem "destination_to_subscriptions_key:#{dest.id.to_s}", self.id.to_s
  end

  def destinations
    array_destination_ids = REDIS.smembers "subscription_to_destinations_key:#{self.id.to_s}"
    return Destination.where(id: array_destination_ids)
  end
  
end
