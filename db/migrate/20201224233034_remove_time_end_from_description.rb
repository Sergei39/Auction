class RemoveTimeEndFromDescription < ActiveRecord::Migration[6.0]
  def change
    remove_column :descriptions, :time_end, :time
  end
end
