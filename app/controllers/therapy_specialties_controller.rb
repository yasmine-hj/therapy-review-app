class TherapySpecialtiesController < ApplicationController

    def index
        @therapy_specialties = TherapySpecialty.alpha
    end

  

end
