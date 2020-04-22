class RentingFolder < ApplicationRecord
  STATUS = ["accepted", "denied", "pending"]
  belongs_to :visit
  belongs_to :folder
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS }
end
