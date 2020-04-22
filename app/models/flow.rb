class Flow < ApplicationRecord
  CATEGORIES = ["income", "spending"]
  belongs_to :renting
  validates :payment_date, :amount, :category, :title, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
