class RentingFolder < ApplicationRecord
  STATUS_RENTINGFOLDER = ["accepted", "denied", "pending"]
  belongs_to :visit
  has_one :renting, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :users, through: :folders
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS_RENTINGFOLDER }

  after_create :send_mail_creation_renting_folder



  private

  #*------------------------------------*#
                #MAILER
  #*------------------------------------*#

  def send_mail_creation_renting_folder
    RentingFolderMailer.with(renter: self.visit.schedule.flat.user, tenant: self.users.first, flat: self.visit.schedule.flat).reting_folder_notification_renter.deliver_now
  end
end
