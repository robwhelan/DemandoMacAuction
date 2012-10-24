class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :title
      t.string :brand
      t.string :image
      t.string :category
      t.string :color
      t.string :condition
      t.float :value
      t.belongs_to :auctions
      t.belongs_to :bids
      t.integer :seller_id
      t.integer :buyer_id

      t.timestamps
    end
    add_index :transactions, :auctions_id
    add_index :transactions, :bids_id
  end
end
