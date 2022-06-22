# frozen_string_literal: true

class AddUserToRecipies < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipies, :user, null: false, foreign_key: true
  end
end
