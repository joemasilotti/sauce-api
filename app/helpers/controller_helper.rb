module ControllerHelper
  include ErrorHelper

  def update_and_redirect(resource)
    @resource = resource
    if resource.update_attributes(params[resource_as_symbol])
      redirect_with_flash(update_flash_message)
    else
      flash[:alert] = error_messages(resource.errors)
      render :edit
    end
  end

  def create_and_redirect(resource)
    @resource = resource
    if resource.save
      redirect_with_flash(create_flash_message)
    else
      flash[:alert] = error_messages(resource.errors)
      render :new
    end
  end

  private

  def resource_name
    @resource.class.to_s
  end

  def resource_as_symbol
    resource_name.downcase.to_sym
  end

  def redirect_with_flash(message)
    redirect_to @resource, notice: message
  end

  def update_flash_message
    "#{resource_name} was successfully updated."
  end

  def create_flash_message
    "#{resource_name} was successfully added."
  end
end
