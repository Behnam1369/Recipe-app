class Food < ApplicationRecord
  belongs_to :user
  has_many :recipy_foods, dependent: :delete_all
end
