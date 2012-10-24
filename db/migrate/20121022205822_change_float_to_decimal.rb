class ChangeFloatToDecimal < ActiveRecord::Migration

  def change

    change_table :auctions do |t|
      t.change(:buy_now_price, :decimal)
      t.change(:lowest_accepted_price, :decimal)
    end

    change_table :bids do |t|
      t.change(:value, :decimal)
    end
    
    change_table :transactions do |t|
      t.change(:value, :decimal)
    end
  end

end
