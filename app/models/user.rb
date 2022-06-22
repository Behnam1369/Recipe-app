class User < ApplicationRecord
  has_many :recipies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
