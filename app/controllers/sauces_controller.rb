class SaucesController < ApplicationController
  def index
    @sauces = Sauce.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @sauce = Sauce.find(params[:id])
  end
end
