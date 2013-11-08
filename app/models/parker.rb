class Parker < ActiveRecord::Base
  belongs_to :lot
  has_many :transactions, dependent: :destroy

  validates_presence_of :plate
  validates_presence_of :start

end
