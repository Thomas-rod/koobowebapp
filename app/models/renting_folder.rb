class RentingFolder < ApplicationRecord
  STATUS = ["accepted", "denied", "pending"]
  belongs_to :visit
  has_one :renting, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :users, through: :folders
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS }
end
