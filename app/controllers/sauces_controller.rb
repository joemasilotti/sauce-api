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

  def new
    @sauce = Sauce.new
  end

  def create
    @sauce = Sauce.new(params[:sauce])

    if @sauce.save
      redirect_to @sauce
    else
      render :new
    end
  end

  def destroy
    @sauce = Sauce.find(params[:id])
    @sauce.destroy

    redirect_to sauces_path
  end
end
