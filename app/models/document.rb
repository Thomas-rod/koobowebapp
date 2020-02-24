class Document < ApplicationRecord
  belongs_to :renting
  validates :label, presence: true
end
