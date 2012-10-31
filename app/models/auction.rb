class Auction < ActiveRecord::Base
  attr_accessible :brand, :buy_now_price, :category, :color, :condition, :description, :image, :lowest_accepted_price, :title, :size, :user_id, :quantity, :active, :percent_off

  has_many :bids
  belongs_to :user
  has_many :transactions
  has_many :delayed_buyers
  
  validates_uniqueness_of :description, :case_sensitive => false
  
  def self.filter(q, auction_owner, category)
    if category
      self.where(:category => category and :active => true)
    elsif auction_owner
      self.where(:user_id => auction_owner and :active => true)
    elsif q
      self.where("description like ?", '%' + q + '%' and :active => true)    
    end
  end

end