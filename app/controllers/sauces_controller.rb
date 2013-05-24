class SaucesController < ApplicationController
  def index
    @sauces = Sauce.all
    respond_to do |format|
      format.html
    end
  end
end
