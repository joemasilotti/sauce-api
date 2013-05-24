class Sauce < ActiveRecord::Base
  attr_accessible :name, :manufacturer

  validates :manufacturer, :presence => true
  validates :name, :presence => true
end
