class RemoveBuyerFromDescriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :descriptions, :buyer, :string
  end
end
