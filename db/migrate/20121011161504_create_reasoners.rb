class CreateReasoners < ActiveRecord::Migration
  def change
    create_table :reasoners do |t|
      t.string :name

      t.timestamps
    end
  end
end
