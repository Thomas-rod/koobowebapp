class Document < ApplicationRecord
  belongs_to :renting
  validates :label, presence: true
end

# We add dependant: :destroy even if we do not allow this to our users. It's cleaner to deal with in DB.
