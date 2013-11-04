class Lot < ActiveRecord::Base
  has_many :parkers, dependent: :destroy
  has_one  :charge, dependent: :destroy
  belongs_to :merchant

  geocoded_by :address
  after_validation :geocode

  private
  def address
    [unitnum, street, city, state, country].join(' ')
  end
end
