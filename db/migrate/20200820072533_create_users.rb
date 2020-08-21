class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :introduction
      t.text :profile_image_id

      t.timestamps
    end
  end
end
