class Parker < ActiveRecord::Base
  belongs_to :lot
  has_many :transactions, dependent: :destroy
end
