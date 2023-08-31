class Court < ApplicationRecord
  belongs_to :establishment
  has_many :matches
end