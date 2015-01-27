class Subscription < ActiveRecord::Base

  belongs_to :user


  def add_destination(dest)
    REDIS.sadd "subscription_to_destinations_key:#{self.id.to_s}", dest.id.to_s
    REDIS.sadd "destination_to_subscriptions_key:#{dest.id.to_s}", self.id.to_s

    # REDIS.sadd self.user_to_destinations_key, dest.id.to_s
    # REDIS.sadd dest.destination_to_users_key, self.id.to_s
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
