class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats, :rentings, :visits, dependent: :destroy
  has_many :schedules, through: :flats
  has_many :documents, through: :rentings
  validates :email, :phone_number uniqueness: true
  validates :first_name, :last_name, :phone_number, :email, presence: true
end
