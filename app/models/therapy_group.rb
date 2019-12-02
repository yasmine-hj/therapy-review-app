class TherapyGroup < ApplicationRecord
  belongs_to :therapy_specialty
  has_many :reviews
  has_many :users, through: :reviews
end
