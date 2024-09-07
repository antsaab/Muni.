class AddBodyToHobbies < ActiveRecord::Migration[6.1]
  def change
    add_column :hobbies, :body, :text
  end
end
