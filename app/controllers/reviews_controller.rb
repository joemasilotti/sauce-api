class ReviewsController < ApplicationController
  include ErrorHelper
  before_filter :authenticate_user!, only: [:new, :create]
  respond_to :html, :json

  def index
    @reviews = sauce.reviews
    respond_with @reviews
  end

  def show
    @review = Review.find(params[:id])
    respond_with @review
  end

  def new
    sauce
    @review = Review.new
  end

  def create
    @review = sauce.reviews.new(params[:review])
    @review.user = current_user

    if @review.save
      respond_with(@sauce, @review, status: 201) and return if request.format == :json
      redirect_to sauce, notice: "Review was successfully added."
    else
      flash[:alert] = error_messages(@review.errors)
      render :new
    end
  end

  private

  def sauce
    @sauce ||= Sauce.find(params[:sauce_id])
  end
end
