class TherapySpecialty < ApplicationRecord
    has_many :therapy_groups

    scope :alpha, -> {order(:name)}

end
