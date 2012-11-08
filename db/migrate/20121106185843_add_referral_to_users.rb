class AddReferralToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.column :referral, :string
  	end
  end
end
