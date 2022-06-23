class RecipyFood < ApplicationRecord
  belongs_to :recipy
  belongs_to :food

  validates :quantity, presence: true, numericality: { integer_only: true }
end
