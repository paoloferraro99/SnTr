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

  def cart_total_price
    total_price = 0
    get_cart_destinations.each { |dest| total_price+= dest.individual_price }
    total_price
  end

  def get_cart_destinations
    cart_ids = REDIS.smembers "cart#{id}"
    Destination.find(cart_ids)
  end
  #

  # Purchasing methods
  def purchase_cart_destinations!
    get_cart_destinations.each { |dest| purchase(dest) }
    REDIS.del "cart#{id}"
  end

  def purchase?(movie)
    movies.include?(movie)
  end

  def purchase(movie)
    movies << movie unless purchase?(movie)
  end
  #

end
