class Sauce < ActiveRecord::Base
  attr_accessible :name, :manufacturer, :flavor_ids
  has_and_belongs_to_many :flavors

  validates :manufacturer, :presence => true
  validates :name, :presence => true
end
