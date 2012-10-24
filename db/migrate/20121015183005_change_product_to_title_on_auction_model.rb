class ChangeProductToTitleOnAuctionModel < ActiveRecord::Migration
  def up
    change_table :auctions do |t|
      t.column :title, :string
      t.remove :product, :string
    end
  end

  def down
    change_table :auctions do |t|
      t.column :product, :string
      t.remove :title, :string
    end
  end
end
