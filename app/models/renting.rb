class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :documents, dependent: :destroy
  has_many :messages
  has_many :flows
end
