class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :messages
  has_many :flows, dependent: :destroy
end
