class Flat < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :visits, through: :schedules
  has_many :documents, through: :rentings
  has_many :rentings, dependent: :destroy
  validates :address, :description, :monthly_price, presence: true
end
