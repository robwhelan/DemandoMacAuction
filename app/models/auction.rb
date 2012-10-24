class Auction < ActiveRecord::Base
  attr_accessible :brand, :buy_now_price, :category, :color, :condition, :description, :image, :lowest_accepted_price, :title, :size, :user_id, :quantity, :active

  has_many :bids
  belongs_to :user
  has_many :transactions
  has_many :delayed_buyers
  
  def self.filter(q, auction_owner, category)
    if category
      self.where(:category => category)
    elsif auction_owner
      self.where(:user_id => auction_owner)
    elsif q
      self.where("description like ?", '%' + q + '%')    
    end
  end

end