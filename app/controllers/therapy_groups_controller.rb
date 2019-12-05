class TherapyGroupsController < ApplicationController
    def index
        @therapy_groups = TherapyGroup.grouped_ratings.includes(:therapy_specialty)
    end

    def new
        @therapy_group = TherapyGroup.new
        @therapy_group.build_therapy_specialty
    end

    def create
        @therapy_group = TherapyGroup.new(therapy_group_params)
        if @therapy_group.save
            redirect_to therapy_groups_path
        else
            @therapy_group.build_therapy_specialty
            render :new
        end
    end

    def show
    end

    def edit
    end

    def ratings
        @therapy_groups = TherapyGroup.grouped_ratings
    end

    private

    def therapy_group_params
        params.require(:therapy_group).permit(:name, :description, :location, :duration, :therapy_specialty_id, therapy_specialty_attributes: [:name])
    end

end
