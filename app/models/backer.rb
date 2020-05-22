class Backer < ApplicationRecord
  belongs_to :record
  has_many :backer_documents

  validates :first_name, :last_name, :email, presence: true

end
