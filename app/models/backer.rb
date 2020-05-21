class Backer < ApplicationRecord
  belongs_to :record

  has_one_attached :identity_card
  has_one_attached :proof_residence
  has_one_attached :proof_work
  has_one_attached :proof_revenue


  validates :first_name, :last_name, :email, presence: true


  validate :identity_card_validation
  validate :proof_residence_validation
  validate :proof_work_validation
  validate :proof_revenue_validation

  def identity_card_validation
    if identity_card.attached? && !identity_card.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:identity_card_format, "Youston, le format n'est pas le bon !")
    end
  end

  def proof_residence_validation
    if proof_residence.attached? && !proof_residence.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:identity_card_format, "Youston, le format n'est pas le bon !")
    end
  end

  def proof_work_validation
    if proof_work.attached? && !proof_work.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:identity_card_format, "Youston, le format n'est pas le bon !")
    end
  end

  def proof_revenue_validation
    if proof_revenue.attached? && !proof_revenue.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:identity_card_format, "Youston, le format n'est pas le bon !")
    end
  end

end
