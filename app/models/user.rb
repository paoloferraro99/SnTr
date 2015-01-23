class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :subscriptions
  has_many :charges

  def self.user_to_destinations_key(user_id)
    "user_to_destinations_key:#{self.id.to_s}"
  end

  def user_to_destinations_key
    User.user_to_destinations_key(self.id)
  end

  def add_destination(dest)
    REDIS.sadd self.user_to_destinations_key, dest.id.to_s
    REDIS.sadd dest.destination_to_users_key, self.id.to_s
  end

  def destinations
    array_desintation_ids = REDIS.smemebers self.user_to_destinations_key
    return Destination.where(id: array_desintation_ids)
  end
  
end
