class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :subscriptions
  # has_many :charges


  # for cart
  def cart_count
    REDIS.scard "cart#{id}"
  end
  #

end
