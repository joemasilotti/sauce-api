class Sauce < ActiveRecord::Base
  attr_accessible :name, :manufacturer_id, :flavor_ids
  belongs_to :manufacturer, :inverse_of => :sauce
  has_many :reviews, :inverse_of => :sauce

  validates :manufacturer, :presence => true
  validates :name, :presence => true
end
