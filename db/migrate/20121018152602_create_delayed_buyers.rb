class CreateDelayedBuyers < ActiveRecord::Migration
  def change
    create_table :delayed_buyers do |t|
      t.belongs_to :auction
      t.belongs_to :user
      t.datetime :unlock_time, :default => 60.minutes.from_now

      t.timestamps
    end
    add_index :delayed_buyers, :auction_id
    add_index :delayed_buyers, :user_id
  end
end
