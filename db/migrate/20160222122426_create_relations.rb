class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :target_id, null: false
      t.integer :from_id,   null: false
      t.timestamps null: false
    end
  end
end
