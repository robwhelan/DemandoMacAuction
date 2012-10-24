class ModifyIndicesOnTransactions < ActiveRecord::Migration
  def change

    remove_index :transactions, :auctions_id
    remove_index :transactions, :bids_id

    change_table :transactions do |t|
      t.remove :auctions_id
      t.remove :bids_id

      t.belongs_to :auction
      t.belongs_to :bid
    end
    
    add_index :transactions, :auction_id
    add_index :transactions, :bid_id
  end

end
