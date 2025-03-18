class ReviewsController < ApplicationController
    before_action :set_request


    def new
      @review = Review.new(request: @request)
      # @review = @request.reviews.new
    end

    def create
      @review = Review.new(review_params)
      @review.request = @request

      if @review.save
        redirect_to request_path(@request), notice: 'Review successfully created!'
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def set_request
      @request = Request.find(params[:request_id])
    end

    def review_params
      params.require(:review).permit(:title, :content, :rating)
    end
end
