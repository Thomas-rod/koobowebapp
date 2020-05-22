class Record < ApplicationRecord
  belongs_to :user
  has_one :backer, dependent: :destroy
  has_many :record_documents

  validates :first_name, :last_name, :email, :phone_number, presence: true


  #*------------------------------------*#
              private
  #*------------------------------------*#

end
