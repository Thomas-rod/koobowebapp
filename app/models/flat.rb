class Flat < ApplicationRecord
  HEATING = ["individuel", "électrique", "central", "gaz"]
  CATEGORY = ["appartement", "maison"]
  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :visits, through: :schedules, dependent: :destroy
  has_many :rentings, dependent: :destroy
  has_many :renting_folders, through: :rentings
  has_one_attached :technical_diagnostic
  has_one_attached :information_leaflet
  has_one_attached :co_owner_document
  has_many_attached :photos
  has_many :flows, through: :rentings
  validate :technical_diagnostic_validation
  validate :information_leaflet_validation
  validate :co_owner_document_validation
  validates :name, :address, :monthly_price, :number_of_rooms, :number_of_bedrooms, :surface, :floor, :heating_system, :category, presence: true
  validates_presence_of :technical_diagnostic, :information_leaflet, :co_owner_document, on: :upload_document


  private

  def technical_diagnostic_validation
    if technical_diagnostic.attached? && !technical_diagnostic.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:technical_diagnostic_format, "Youston, le format n'est pas le bon !")
    end
  end

  def information_leaflet_validation
    if information_leaflet.attached? && !information_leaflet.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:information_leaflet_format, "Youston, le format n'est pas le bon !")
    end
  end

  def co_owner_document_validation
    if co_owner_document.attached? && !co_owner_document.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:co_owner_document_format, "Youston, le format n'est pas le bon !")
    end
  end
end
