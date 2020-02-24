class Visit < ApplicationRecord
  belongs_to :schedule
  belongs_to :user
end
