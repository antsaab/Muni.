class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :message
      t.integer :user_id
      t.integer :room_id
      t.timestamps
    end
  end
end
