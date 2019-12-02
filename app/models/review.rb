class Review < ApplicationRecord
  belongs_to :therapy_group
  belongs_to :user
end
