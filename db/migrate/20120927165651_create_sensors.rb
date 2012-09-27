class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :measurement
      t.string :scale
      t.decimal :value

      t.timestamps
    end
  end
end
