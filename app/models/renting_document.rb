class RentingDocument < ApplicationRecord
  KIND_RECORD_DOCOUMENT = %w(backer tenant)
  belongs_to :renting
  belongs_to :document

  validates :kind, inclusion: {in: KIND_RECORD_DOCOUMENT}

end
