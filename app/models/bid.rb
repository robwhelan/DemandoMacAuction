class Bid < ActiveRecord::Base
  attr_accessible :value, :user_id, :auction_id

  belongs_to :user
  belongs_to :auction
  has_one :transaction

  #before_save :check_buyer_ability_to_bid
  after_save :compare_bid_to_lowest_accepted_price
  
  def check_buyer_ability_to_bid
  end

  def compare_bid_to_lowest_accepted_price
    if self.value < self.auction.lowest_accepted_price
      delay_buyer
    else
      bid_wins
    end
  end

  def delay_buyer
    delayed_buyer = DelayedBuyer.create(
          :auction_id   => self.auction_id,
          :user_id      => self.user_id,
          :unlock_time  => 60.minutes.from_now
    )
  end
  
  def bid_wins
    trans = Transaction.create(
      :title =>       self.auction.title,
      :brand =>       self.auction.brand,
      :image =>       self.auction.image,
      :category =>    self.auction.category,
      :color =>       self.auction.color,
      :condition =>   self.auction.condition,
      :value =>       self.value,
      :auction_id =>  self.auction.id,
      :bid_id =>      self.id,
      :seller_id =>   self.auction.user_id,
      :buyer_id =>    self.user.id
    )
    return true
  end

end
