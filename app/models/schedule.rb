class Schedule < ApplicationRecord
  belongs_to :flat
  has_many :visits, dependent: :destroy
  validates :start, :end, presence: true
  validates :start, uniqueness: { scope: :flat_id }
  validates :end, uniqueness: { scope: :flat_id }
  # It's not a good thing to add uniqueness with start/end because it will not allow an other flat to booked this schedule.

  # DO NOT REMOVE
  def to_s
    "Bien #{flat.id} #{start} #{self.end}"
  end
end

