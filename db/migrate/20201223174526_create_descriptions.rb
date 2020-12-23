class CreateDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :descriptions do |t|
      t.string :title
      t.text :text
      t.time :time_end
      t.float :price
      t.float :raise_by
      t.string :buyer

      t.timestamps
    end
  end
end
