class AddPercentOffToAuction < ActiveRecord::Migration
  def change
	change_table :auctions do |t|
		t.column :percent_off, :integer
	end
  end
end
