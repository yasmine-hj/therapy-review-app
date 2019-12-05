class TherapySpecialty < ApplicationRecord
    has_many :therapy_groups
    validates :name, presence: true, uniqueness: true

    scope :alpha, -> {order(:name)}

end
