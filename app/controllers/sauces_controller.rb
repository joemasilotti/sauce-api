class SaucesController < ApplicationController
  respond_to :html, :json

  def index
    @sauces = Sauce.all
    respond_with @sauces
  end

  def show
    @sauce = Sauce.find(params[:id])
    respond_with @sauce
  end

  def edit
    @sauce = Sauce.find(params[:id])
    #respond_with @sauce
  end

  def update
    @sauce = Sauce.find(params[:id])

    if @sauce.update_attributes(params[:sauce])
      redirect_to @sauce
    else
      render :edit
    end
  end
end
