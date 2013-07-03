class SaucesController < ApplicationController
  include ErrorHelper
  before_filter :authenticate_admin!, only: [:edit, :update, :new, :create, :destroy]
  respond_to :html, :json

  def index
    if admin_signed_in?
      @actions = [:show, :edit, :delete]
    elsif user_signed_in?
      @actions = [:show, :review]
    else
      @actions = [:show]
    end

    @sauces = Sauce.all
    respond_with @sauces
  end

  def show
    @sauce = Sauce.find(params[:id])
    @reviews = @sauce.reviews
    respond_with @sauce
  end

  def edit
    @sauce = Sauce.find(params[:id])
  end

  def update
    @sauce = Sauce.find(params[:id])
    if @sauce.update_attributes(params[:sauce])
      redirect_to @sauce, notice: "Sauce was successfully updated."
    else
      flash[:alert] = error_messages(@sauce.errors)
      render :edit
    end
  end

  def new
    @sauce = Sauce.new
  end

  def create
    @sauce = Sauce.new(params[:sauce])
    if @sauce.save
      redirect_to @sauce, notice: "Sauce was successfully added."
    else
      flash[:alert] = error_messages(@sauce.errors)
      render :new
    end
  end

  def destroy
    @sauce = Sauce.find(params[:id])
    @sauce.destroy

    redirect_to sauces_path, notice: "Sauce was successfully deleted."
  end
end
