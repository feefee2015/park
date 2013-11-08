class Lot < ActiveRecord::Base
  has_many :parkers, dependent: :destroy
  has_one  :charge, dependent: :destroy
  belongs_to :merchant

  validates_presence_of :unitnum
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :country

  geocoded_by :address
  after_validation :geocode

  private
  def address
    [unitnum, street, city, state, country].join(' ')
  end
end
