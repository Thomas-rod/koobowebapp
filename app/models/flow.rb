class Flow < ApplicationRecord
  belongs_to :renting_id
  validates :payment_date, :amount, :type, presence: true
end
