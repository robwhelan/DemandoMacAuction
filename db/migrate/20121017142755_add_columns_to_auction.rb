class AddColumnsToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :quantity, :integer
    add_column :auctions, :active, :boolean, :default => true
  end
end
