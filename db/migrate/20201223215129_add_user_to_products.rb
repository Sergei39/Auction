class AddUserToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :user, :integer
  end
end
