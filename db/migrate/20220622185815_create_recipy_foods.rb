class CreateRecipyFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipy_foods do |t|
      t.integer :quantity
      t.references :recipy, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
