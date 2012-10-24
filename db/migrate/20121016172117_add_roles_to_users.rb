class AddRolesToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.column :role, :string
      t.column :user_name, :string
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :address_line1, :string
      t.column :address_line2, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip, :string
      t.column :phone, :string
    end
  end
  
  def down
    change_table :users do |t|
      t.remove(:admin, :seller, :buyer, :user_name, :first_name, :last_name, :address_line1, :address_line2, :city, :state, :zip)
    end
  end
  
end