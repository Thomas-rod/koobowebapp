class Schedule < ApplicationRecord
  belongs_to :flat
  has_many :visits, dependent: :destroy
  validates :start, :end, presence: true
  validates :start, uniqueness: { scope: :end }
end
