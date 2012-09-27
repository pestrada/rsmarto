class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :type
      t.string :name
      t.decimal :value
      t.string :scale

      t.timestamps
    end
  end
end
