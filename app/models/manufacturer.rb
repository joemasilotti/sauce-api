class Manufacturer < ActiveRecord::Base
  attr_accessible :name
  has_many :sauce, :inverse_of => :manufacturer

  validates :name, :presence => true
end
