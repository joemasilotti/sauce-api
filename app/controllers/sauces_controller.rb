class SaucesController < ApplicationController
  include ControllerHelper
  before_filter :authenticate_admin!, only: [:edit, :update, :new, :create, :destroy]
  respond_to :html, :json

  def index
    if admin_signed_in?
      @actions = [:show, :edit, :add, :delete]
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
    update_and_redirect(@sauce)
  end

  def new
    @sauce = Sauce.new
  end

  def create
    @sauce = Sauce.new(params[:sauce])
    create_and_redirect(@sauce)
  end

  def destroy
    @sauce = Sauce.find(params[:id])
    @sauce.destroy

    redirect_to sauces_path, notice: "Sauce was successfully deleted."
  end
end
