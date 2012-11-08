class Bid < ActiveRecord::Base
  attr_accessible :value, :user_id, :auction_id, :is_winning

  belongs_to :user
  belongs_to :auction
  has_many :transactions
  
  validates_presence_of :value
  validates_numericality_of :value

  after_save :compare_bid_to_lowest_accepted_price

  def compare_bid_to_lowest_accepted_price
    if self.is_winning
    	return
    elsif self.value < self.auction.lowest_accepted_price
      delay_buyer
    else
      bid_wins
    end
  end

  def delay_buyer
    delayed_buyer = DelayedBuyer.create(
          :auction_id   => self.auction_id,
          :user_id      => self.user_id,
          :unlock_time  => 30.minutes.from_now
    )
  end
  
  def bid_wins
	self.update_attributes(:is_winning => true)
  end

end
