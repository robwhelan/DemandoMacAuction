class CreateProductSearches < ActiveRecord::Migration
  def change
    create_table :product_searches do |t|
      t.column :keywords, :string
      t.timestamps
    end
  end
end
