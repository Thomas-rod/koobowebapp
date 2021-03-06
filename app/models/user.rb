class User < ApplicationRecord

  require 'open-uri'
  require 'json'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats, dependent: :destroy
  has_many :rentings, through: :flats, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :schedules, through: :flats
  has_many :renting_folders, through: :visits
  has_many :records, dependent: :destroy
  has_one_attached :photo
  validates :email, uniqueness: true
  validates :email, presence: true
  has_many :flows, through: :rentings

  before_save { self.email = email.downcase }
  after_create :send_welcome_email
  after_create :record_creation

#*------------------------------------*#
          # FACEBOOK AUTHENTIFICATION
#*------------------------------------*#

  def self.find_for_facebook_oauth(auth)
      user_params = auth.slice("provider", "uid")
      user_params.merge! auth.info.slice("email", "first_name", "last_name")
      user_params[:facebook_picture_url] = auth.info.image
      user_params[:token] = auth.credentials.token
      user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
      user_params = user_params.to_h
      user = User.find_by(provider: auth.provider, uid: auth.uid)
      user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
      if user
        user.update(user_params)
      else
        user = User.new(user_params)
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.save
      end
      return user
    end


  def attach_facebook_pp(profile_picture)
    file = URI.open(profile_picture)
    self.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  end

  private

  def record_creation
    @record = Record.new(user: self, first_name: self.first_name, last_name: self.last_name, email: self.email, phone_number: self.phone_number)
    @record.save!
  end

  #*------------------------------------*#
                    #MAIL
  #*------------------------------------*#

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_later!(wait_until: 2.minutes.from_now)
  end
end
