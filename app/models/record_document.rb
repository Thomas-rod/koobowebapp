class RecordDocument < ApplicationRecord
  belongs_to :document
  belongs_to :record
end
