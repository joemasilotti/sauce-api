class ManufacturersController < ApplicationController
  respond_to :html, :json

  def index
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

    if @manufacturer.update_attributes(params[:manufacturer])
      redirect_to @manufacturer, notice: "Manufacturer was successfully updated."
    else
      flash[:alert] = @manufacturer.error_messages
      render :edit
    end
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(params[:manufacturer])

    if @manufacturer.save
      redirect_to @manufacturer, notice: "Manufacturer was successfully added."
    else
      flash[:alert] = @manufacturer.error_messages
      render :new
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy

    redirect_to manufacturers_path, notice: "Manufacturer was successfully deleted."
  end
end
