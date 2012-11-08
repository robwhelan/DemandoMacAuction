class AddWinningStatusToBids < ActiveRecord::Migration
  def change
	change_table :bids do |t|
		t.column :is_winning, :boolean, :default => false
	end
  end
end
