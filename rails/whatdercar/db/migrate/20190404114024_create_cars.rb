class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :carno
      t.text :rant

      t.timestamps
    end
  end
end
