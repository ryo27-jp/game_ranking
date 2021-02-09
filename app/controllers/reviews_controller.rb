class ReviewsController < ApplicationController
  before_action :require_login

  # def new
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to game_path(params[:game_id])
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    redirect_back(fallback_location: root_url)
  end

  private

  def review_params
    params.require(:review).permit(:body).merge(user_id: current_user.id, game_id: params[:game_id])
  end
end
