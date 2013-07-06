class FlavorsController < ApplicationController
  include ControllerHelper
  before_filter :authenticate_admin!, only: [:edit, :update, :new, :create, :destroy]
  respond_to :html, :json

  def index
    if admin_signed_in?
      @actions = [:show, :edit, :delete]
    else
      @actions = [:show]
    end

    @flavors = Flavor.all
    respond_with @flavors
  end

  def show
    @flavor = Flavor.find(params[:id])
    respond_with @flavor
  end

  def edit
    @flavor = Flavor.find(params[:id])
  end

  def update
    @flavor = Flavor.find(params[:id])
    update_and_redirect(@flavor)
  end

  def new
    @flavor = Flavor.new
  end

  def create
    @flavor = Flavor.new(params[:flavor])
    create_and_redirect(@flavor)
  end

  def destroy
    @flavor = Flavor.find(params[:id])
    @flavor.destroy

    redirect_to flavors_path, notice: "Flavor was successfully deleted."
  end
end
