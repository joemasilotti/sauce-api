module ErrorHelper
  def error_messages(errors)
    errors.full_messages.map{ |item| item + '. '}.join.strip!
  end
end
