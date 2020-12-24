class AddProductToDescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :descriptions, :product, :integer
    add_index :descriptions, :product, unique: true
  end
end
