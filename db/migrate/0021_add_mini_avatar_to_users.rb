class AddMiniAvatarToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mini_avatar, :string
  end
end
