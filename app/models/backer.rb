class Backer < ApplicationRecord
  belongs_to :record

  validates :first_name, :last_name, :revenu, :phone_number, :email, presence: true

end
