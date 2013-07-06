class ManufacturersController < ApplicationController
  include ControllerHelper
  before_filter :authenticate_admin!, only: [:edit, :update, :new, :create, :destroy]
  respond_to :html, :json

  def index
    if admin_signed_in?
      @actions = [:show, :edit]
    else
      @actions = [:show]
    end

    @manufacturers = Manufacturer.all
    respond_with @manufacturers
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    respond_with @manufacturer
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    update_and_redirect(@manufacturer)
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(params[:manufacturer])
    create_and_redirect(@manufacturer)
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy

    redirect_to manufacturers_path, notice: "Manufacturer was successfully deleted."
  end
end
