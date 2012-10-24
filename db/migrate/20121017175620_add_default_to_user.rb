class AddDefaultToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change_default(:role, 'buyer')
    end
  end
end
