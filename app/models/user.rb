class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats, dependent: :destroy
  has_many :rentings, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :schedules, through: :flats
  has_many :documents, through: :rentings
  has_one_attached :photo
  validates :email, uniqueness: true
  validates :email, presence: true
  has_many :folders
end
