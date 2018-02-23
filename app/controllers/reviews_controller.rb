class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id]) # :restaurant_id is added by the 2-arguments simple_form in views/reviews/_form
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
