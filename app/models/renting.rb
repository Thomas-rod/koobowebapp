class Renting < ApplicationRecord
  STATUS_RENTING = ['current', 'past', 'ongoing']
  belongs_to :flat
  belongs_to :renting_folder
  has_many :messages
  has_many :flows, dependent: :destroy

  validates :status, inclusion: { in: STATUS_RENTING }
end
