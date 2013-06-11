class Manufacturer < ActiveRecord::Base
  attr_accessible :name
  has_many :sauce, :inverse_of => :manufacturer

  validates :name, :presence => true

  def error_messages
    errors.full_messages.map{ |item| item + '.'}.join
  end
end
