class RentingFolder < ApplicationRecord
  STATUS_RENTINGFOLDER = ["accepted", "denied", "pending"]
  belongs_to :visit
  has_one :renting, dependent: :destroy
  has_one :user


  validates :status, presence: true
  validates :status, inclusion: { in: STATUS_RENTINGFOLDER }

  after_create :send_mail_creation_renting_folder



  private

  #*------------------------------------*#
                #MAILER
  #*------------------------------------*#

  def send_mail_creation_renting_folder
    RentingFolderMailer.with(renter: self.visit.schedule.flat.user, tenant: self.visit.user, flat: self.visit.schedule.flat).renting_folder_notification_renter.deliver_now
  end

  def send_mail_answer_renting_folder
    RentingFolderMailer.with(renter: self.visit.schedule.flat.user, tenant: self.visit.user, flat: self.visit.schedule.flat, renting_folder: self).renting_folder_notification_tenant.deliver_now
  end
end
