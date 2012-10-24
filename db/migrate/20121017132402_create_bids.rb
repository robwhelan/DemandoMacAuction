class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :value
      t.belongs_to :auction
      t.belongs_to :user
      t.timestamps
    end
    
    add_index :bids, :auction_id
    add_index :bids, :user_id
    
  end
end
