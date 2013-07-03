class Review < ActiveRecord::Base
  belongs_to :user, inverse_of: :reviews
  belongs_to :sauce, inverse_of: :reviews
  has_and_belongs_to_many :flavors

  validates :rating, inclusion: -1..1

  attr_accessible :rating, :flavor_ids
end
