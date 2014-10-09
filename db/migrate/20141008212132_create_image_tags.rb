class CreateImageTags < ActiveRecord::Migration
  def change
    create_table :image_tags do |t|
      t.integer :image_id
      t.integer :tag_id

      t.timestamps
    end

    add_index :image_tags, [:image_id, :tag_id], unique: true
  end
end
