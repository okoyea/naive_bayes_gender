class CreatePeople < ActiveRecord::Migration
    create_table :people do |t|
      t.string :gender
      t.integer :height
      t.integer :weight

      t.timestamps
    end
end
