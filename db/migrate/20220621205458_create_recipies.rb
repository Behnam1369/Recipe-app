class CreateRecipies < ActiveRecord::Migration[7.0]
  def change
    create_table :recipies do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.string :description
      t.boolean :public

      t.timestamps
    end
  end
end
