class Merchant < ActiveRecord::Base
  has_many :lots, dependent: :destroy
end
