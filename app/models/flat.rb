class Flat < ApplicationRecord


  #*------------------------------------*#
          #CONSTANTS VARIABLE
  #*------------------------------------*#
  HEATING = ["individuel", "électrique", "central", "gaz"]
  CATEGORY = ["appartement", "maison"]


  #*------------------------------------*#
          #MODEL
  #*------------------------------------*#
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


  #*------------------------------------*#
          #VALIDATIONS
  #*------------------------------------*#
  validate :technical_diagnostic_validation
  validate :information_leaflet_validation
  validate :co_owner_document_validation
  validates :name, :address, :monthly_price, :number_of_rooms, :number_of_bedrooms, :surface, :floor, :heating_system, :category, presence: true
  validates :property_advertisement, uniqueness: true
  validates_presence_of :technical_diagnostic, :information_leaflet, :co_owner_document, on: :upload_document
  geocoded_by :address

  #*------------------------------------*#
                  #CALLBACKS
  #*------------------------------------*#
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :flat_to_zapier if Rails.env.production?
  after_create :property_advertisement_generation

  def flat_to_zapier
    Zapier::FlatCreation.new(self).post_to_zapier
  end

  def property_advertisement_generation
    self.property_advertisement = "koobo-#{self.id}"
    self.save!
  end

  #*------------------------------------*#
    #METHOD - DOCUMENT ATTACHED
  #*------------------------------------*#

  def number_file_attached
    counter = 0
    counter += 1 if self.technical_diagnostic.attached?
    counter += 1 if self.information_leaflet.attached?
    counter += 1 if self.co_owner_document.attached?
    return counter
  end

#*------------------------------------*#
  #METHOD - FLOWS
#*------------------------------------*#
  def flat_earnings
    earnings = 0

    unless self.rentings.nil? || self.rentings.empty?
      self.rentings.each do |renting|
        renting.flows.each do |flow|
          flow.category == "revenu" ? earnings += flow.amount : ""
        end
      end
    end
    return earnings
  end

  def flat_spendings
    spendings = 0
    unless self.rentings.nil? || self.rentings.empty?
      self.rentings.each do |renting|
        renting.flows.each do |flow|
          flow.category == "dépense" ? spendings -= flow.amount : ""
        end
      end
    end
    return spendings
  end

#*------------------------------------*#
  #METHOD RENTING
#*------------------------------------*#
  def is_there_renting?
    rentings = self.rentings.select{ |r| r.status == 'past' || r.status == 'current'}
    return rentings.sort_by{ |r| r[:status]}
  end

#*------------------------------------*#
            private
#*------------------------------------*#

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

