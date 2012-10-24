class DelayedBuyer < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user
  attr_accessible :unlock_time, :auction_id, :user_id
  
end
