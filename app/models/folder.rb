class Folder < ApplicationRecord
  belongs_to :user
  belongs_to :renting_folder
end
