class Lot < ActiveRecord::Base
  has_many :parkers, dependent: :destroy
  has_one  :charge, dependent: :destroy
  belongs_to :merchant
end
