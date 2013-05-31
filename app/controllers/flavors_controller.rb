class FlavorsController < ApplicationController
  respond_to :html, :json

  def index
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

    if @flavor.update_attributes(params[:flavor])
      redirect_to @flavor
    else
      render :edit
    end
  end

  def new
    @flavor = Flavor.new
  end

  def create
    @flavor = Flavor.new(params[:flavor])

    if @flavor.save
      redirect_to @flavor
    else
      render :new
    end
  end

  def destroy
    @flavor = Flavor.find(params[:id])
    @flavor.destroy

    redirect_to flavors_path
  end
end
