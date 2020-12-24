class AddBuyerIdToDescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :descriptions, :buyer_id, :integer
  end
end
