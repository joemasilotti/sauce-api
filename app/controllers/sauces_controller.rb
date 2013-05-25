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
end
