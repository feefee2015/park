class Merchant < ActiveRecord::Base
  has_many :lots, dependent: :destroy

  validates_presence_of :firstName
  validates_presence_of :unitnum
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :country
  validates_presence_of :phone

end
