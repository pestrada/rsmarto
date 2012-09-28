class CreateSmartObjects < ActiveRecord::Migration
  
  def change
    create_table :smart_objects do |t|
      t.string :object_type
      t.string :name
      t.string :status
      
      t.timestamps
    end
  end

end
