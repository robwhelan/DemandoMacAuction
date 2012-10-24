class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :product
      t.string :description
      t.string :image
      t.string :category
      t.string :brand
      t.string :size
      t.string :color
      t.string :condition
      t.float :buy_now_price
      t.float :lowest_accepted_price
      t.integer :user_id
    	t.belongs_to :user
      t.timestamps
    end
  
  add_index :auctions, :user_id
  
  end
end
