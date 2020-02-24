class Visit < ApplicationRecord
  STATUS = ["accepted", "denied", "pending"]
  belongs_to :schedule
  belongs_to :user
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS }
end
