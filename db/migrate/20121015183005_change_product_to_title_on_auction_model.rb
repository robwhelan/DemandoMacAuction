class ChangeProductToTitleOnAuctionModel < ActiveRecord::Migration
  def up
    change_table :auctions do |t|
      t.column :title, :string
      t.remove :product
    end
  end

  def down
    change_table :auctions do |t|
      t.column :product, :string
      t.remove :title
    end
  end
end
