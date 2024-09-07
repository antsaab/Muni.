class CreateHobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :hobbies do |t|
      t.string :hobby
      t.string :genre

      t.timestamps
    end
  end
end
