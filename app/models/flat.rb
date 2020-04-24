class Flat < ApplicationRecord
  HEATING = ["individuel", "électrique", "central", "gaz"]
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :visits, through: :schedules, dependent: :destroy
  has_many :rentings, dependent: :destroy
  has_many :renting_folders, through: :rentings
  has_one_attached :technical_diagnostic
  has_one_attached :information_leaflet
  has_one_attached :co_owner_document
  has_many_attached :photos
  validates :name, :address, :monthly_price, :number_of_rooms, :number_of_bedrooms, :surface, :floor, :heating_system, presence: true
end
