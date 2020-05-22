class RentingDocument < ApplicationRecord
  belongs_to :renting
  belongs_to :document
end
