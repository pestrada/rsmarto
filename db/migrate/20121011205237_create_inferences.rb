class CreateInferences < ActiveRecord::Migration
  def change
    create_table :inferences do |t|
      t.string :body
      t.references :smart_object

      t.timestamps
    end
    
    add_index :inferences, :smart_object_id
  end
end
