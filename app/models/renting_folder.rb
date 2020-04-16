class RentingFolder < ApplicationRecord
  STATUS = ["accepted", "denied", "pending"]
  belongs_to :visit_id
  belongs_to :folder_id
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS }
end
