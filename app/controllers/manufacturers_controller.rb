class ManufacturersController < ApplicationController
  include ErrorHelper
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
    redirect_to new_admin_session_path, alert: "You must be logged in to edit a manufacturer." and return if !admin_signed_in?

    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    redirect_to new_admin_session_path, alert: "You must be logged in to edit a manufacturer." and return if !admin_signed_in?

    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update_attributes(params[:manufacturer])
      redirect_to @manufacturer, notice: "Manufacturer was successfully updated."
    else
      flash[:alert] = error_messages(@manufacturer.errors)
      render :edit
    end
  end

  def new
    redirect_to new_admin_session_path, alert: "You must be logged in to create a manufacturer." and return if !admin_signed_in?

    @manufacturer = Manufacturer.new
  end

  def create
    redirect_to new_admin_session_path, alert: "You must be logged in to create a manufacturer." and return if !admin_signed_in?

    @manufacturer = Manufacturer.new(params[:manufacturer])
    if @manufacturer.save
      redirect_to @manufacturer, notice: "Manufacturer was successfully added."
    else
      flash[:alert] = error_messages(@manufacturer.errors)
      render :new
    end
  end

  def destroy
    redirect_to new_admin_session_path, alert: "You must be logged in to delete a manufacturer." and return if !admin_signed_in?

    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy

    redirect_to manufacturers_path, notice: "Manufacturer was successfully deleted."
  end
end
