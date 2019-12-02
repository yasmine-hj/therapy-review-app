class TherapyGroupsController < ApplicationController
    def index
        @therapy_groups = TherapyGroup.all
    end

    def new
        @therapy_group = TherapyGroup.new
        @bourbon.build_therapy_specialty
    end

    def create
        @therapy_group = TherapyGroup.new(therapy_group_params)
        if therapy_group.save
            redirect_to therapy_group_path
        else
            @therapy_group.build_therapy_specialty
            render :new
        end
    end

    def ratings
        @therapy_groups = TherapyGroup.grouped_ratings
    end

    private

    def therapy_group_params
        params.require(:therapy_group).permit(:name, :description, :location, :duration, :therapy_specialty_id, therapy_specialty_attributes: [name])
    end

end
