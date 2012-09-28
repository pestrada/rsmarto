class CreateSensors < ActiveRecord::Migration
  
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :measurement
      t.string :scale
      t.decimal :value
      t.references :smart_object
      
      t.timestamps
    end
    
    add_index :sensors, :smart_object_id
  end

end
