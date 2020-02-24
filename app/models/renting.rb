class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :documents
end
