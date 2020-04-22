class Visit < ApplicationRecord
  STATUS = ["accepted", "denied", "pending"]
  # We can use Enum (rails)
  has_many :renting_folders
  belongs_to :schedule
  belongs_to :user
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS }
end
