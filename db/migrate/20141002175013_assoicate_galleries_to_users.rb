class AssoicateGalleriesToUsers < ActiveRecord::Migration
  def up
    add_column :galleries, :user_id, :integer

    user = select_one "SELECT id FROM users LIMIT 1"
    update "UPDATE galleries SET user_id = #{user["id"]}"

    change_column_null :galleries, :user_id, false
  end

  def down
    remove_column :galleries, :user_id
  end
end
