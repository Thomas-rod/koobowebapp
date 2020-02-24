class Flat < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :visits, through: :schedules
  has_many :documents, through: :rentings
  validates :address, :description, :monthly_price, presence: true
end
