class Document < ApplicationRecord
  TYPE_DOCUMENTS = ['Quittances', 'Etat des lieux', 'Dossier Location', 'Bail']
  belongs_to :renting
  validates :label, presence: true
  validates :label, inclusion: { in: TYPE_DOCUMENTS }
end

# We add dependant: :destroy even if we do not allow this to our users. It's cleaner to deal with in DB.
