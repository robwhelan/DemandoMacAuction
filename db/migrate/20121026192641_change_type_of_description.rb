class ChangeTypeOfDescription < ActiveRecord::Migration
  def change
	change_table :auctions do |t|
		t.change(:description, :text, :limit => nil)
	end
  end
end