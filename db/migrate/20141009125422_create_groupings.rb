class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.integer :image_id
      t.integer :group_id

      t.timestamps
    end

    add_index :groupings, [:image_id, :group_id], unique: true
  end
end
