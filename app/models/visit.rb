class Visit < ApplicationRecord
  STATUS_VISIT = ["accepted", "denied", "pending"]
  NUMBER_PEOPLE = [1,2,3,4,5,6,7]
  TYPE_CONTRACTS = ["CDI", "CDD", "Interime", "Freelance", "Intermittent", "Chef d'entreprise", "Etudiant"]


  # We can use Enum (rails)
  has_one :renting_folder, dependent: :destroy
  belongs_to :schedule
  belongs_to :user
  validates :status, presence: true
  validates :income, numericality: true
  validates :status, inclusion: { in: STATUS_VISIT }
  validates :people, inclusion: { in: NUMBER_PEOPLE }
  validates :contract, inclusion: { in: TYPE_CONTRACTS}
  after_create :send_email_renter_after_visit_creation


#*------------------------------------*#
                #CALLBACK
#*------------------------------------*#

  def change_booked_status_schedule
    schedule_to_update = self.schedule
    schedule.update!(booked: true)
  end

  private

#*------------------------------------*#
                  #MAIL
#*------------------------------------*#

  def send_email_renter_after_visit_creation
    VisitMailer.with(renter: self.schedule.flat.user, tenant: self.user).visit_notification_renter.deliver_now
  end

  def send_email_tenant_after_visit
    VisitMailer.with(tenant: self.user).send_answer_visit_mail.deliver_now
  end


end
