class Transaction < ActiveRecord::Base
  belongs_to :auction
  belongs_to :bid

  attr_accessible :brand, :buyer_id, :category, :color, :condition, :image, :seller_id, :title, :value, :bid_id, :auction_id
  attr_accessor :card_number, :card_verification_code #stored in memory but never to database; you can make form fields for them this way

  after_save :modify_auction_status
  after_save :notify_about_winning_bid
  
  def modify_auction_status
    self.auction.update_attribute :active, false
  end
  
  def notify_about_winning_bid
    
  end

end
