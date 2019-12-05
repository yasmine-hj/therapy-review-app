class ReviewsController < ApplicationController
    def index

        if @therapy_group = TherapyGroup.find_by_id(params[:therapy_group_id])
            @reviews = @therapy_group.reviews.all
        else
            @reviews = Review.all
        end
    end

    def new
        if @therapy_group = TherapyGroup.find_by_id(params[:therapy_group_id])
            @review = @therapy_group.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @therapy_group = TherapyGroup.find_by_id(params[:id])
        @review = Review.find_by_id(params[:id])
    end

  
    private
    def review_params
        params.require(:review).permit(:stars, :title, :content, :therapy_group_id)
    end
end
