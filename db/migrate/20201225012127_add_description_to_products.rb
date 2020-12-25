class AddDescriptionToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :description, :integer
  end
end
