class ReviewsController < ApplicationController

  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @flat = Flat.find(params[:flat_id])
    @review.flat = @flat
    @review.user = current_user
    if @review.save
      redirect_to flat_path(@flat, anchor: "review-#{@review.id}")
    else
      render 'flats/show'
    end
  end


  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to flat_path(@review.flat)
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

