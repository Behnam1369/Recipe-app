class Recipy < ApplicationRecord
  belongs_to :user
  has_many :recipy_foods, dependent: :delete_all

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true

  def foods
    RecipyFood.where(recipy_id: di)
  end
end
