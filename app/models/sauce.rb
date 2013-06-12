class Sauce < ActiveRecord::Base
  attr_accessible :name, :manufacturer_id, :flavor_ids
  belongs_to :manufacturer, :inverse_of => :sauce
  has_and_belongs_to_many :flavors

  validates :manufacturer, :presence => true
  validates :name, :presence => true
end
