class Flat < ApplicationRecord
  HEATING = ["individuel", "électrique", "central", "gaz"]
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :visits, through: :schedules
  has_many :documents, through: :rentings
  has_many :rentings, dependent: :destroy
  has_many_attached :photos
  # validates :address, :monthly_price, presence: true
end
