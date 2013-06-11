class Flavor < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :sauces

  validates :name, :presence => true

  def error_messages
    errors.full_messages.map{ |item| item + '.'}.join
  end
end
