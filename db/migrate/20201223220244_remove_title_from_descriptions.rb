class RemoveTitleFromDescriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :descriptions, :title, :string
  end
end
