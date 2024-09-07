class AddUserIdToHobbies < ActiveRecord::Migration[6.1]
  def change
    add_column :hobbies, :user_id, :integer
  end
end
