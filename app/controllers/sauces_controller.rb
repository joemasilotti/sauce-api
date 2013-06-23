class SaucesController < ApplicationController
  include ErrorHelper
  respond_to :html, :json

  def index
    if admin_signed_in?
      @actions = [:show, :edit, :delete]
    else
      @actions = [:show]
    end

    @sauces = Sauce.all
    respond_with @sauces
  end

  def show
    @sauce = Sauce.find(params[:id])
    respond_with @sauce
  end

  def edit
    redirect_to new_admin_session_path, alert: "You must be logged in to edit a sauce." and return if !admin_signed_in?

    @sauce = Sauce.find(params[:id])
    @flavors = Flavor.all
  end

  def update
    redirect_to new_admin_session_path, alert: "You must be logged in to edit a sauce." and return if !admin_signed_in?

    @sauce = Sauce.find(params[:id])
    if @sauce.update_attributes(params[:sauce])
      redirect_to @sauce, notice: "Sauce was successfully updated."
    else
      flash[:alert] = error_messages(@sauce.errors)
      render :edit
    end
  end

  def new
    redirect_to new_admin_session_path, alert: "You must be logged in to create a sauce." and return if !admin_signed_in?

    @sauce = Sauce.new
  end

  def create
    redirect_to new_admin_session_path, alert: "You must be logged in to create a sauce." and return if !admin_signed_in?

    @sauce = Sauce.new(params[:sauce])
    if @sauce.save
      redirect_to @sauce, notice: "Sauce was successfully added."
    else
      flash[:alert] = error_messages(@sauce.errors)
      render :new
    end
  end

  def destroy
    redirect_to new_admin_session_path, alert: "You must be logged in to delete a sauce." and return if !admin_signed_in?

    @sauce = Sauce.find(params[:id])
    @sauce.destroy

    redirect_to sauces_path, notice: "Sauce was successfully deleted."
  end
end
