class Record < ApplicationRecord
  belongs_to :user

  has_one_attached :identity_card
  has_many_attached :payslips
  has_one_attached :proof_residence
  has_one_attached :notice_assessment
  has_one_attached :student_card
  has_one_attached :residency_permit
  has_one_attached :bank_identity


  validate :identity_card_validation
  validate :payslips_validation
  validate :proof_residence_validation
  validate :notice_assessment_validation
  validate :student_card_validation
  validate :residency_permit_validation
  validate :bank_identity_validation

  #*------------------------------------*#
              private
  #*------------------------------------*#
  def identity_card_validation
    if identity_card.attached? && !identity_card.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:identity_card_format, "Youston, le format n'est pas le bon !")
    end
  end

  def payslips_validation
    if payslips.count > 3
      errors.add(:payslips_format, 'Ah ! Malheureusement, seul 3 documents sont autorisés')
    end
    payslips.each do |payslip|
      unless payslip.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
        errors.add(:payslips_format, "Le format n'est pas le bon ! Essaye à nouveau")
        raise
      end
    end
  end

  def proof_residence_validation
    if proof_residence.attached? && !proof_residence.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:proof_residence_format, "Youston, le format n'est pas le bon !")
    end
  end

  def notice_assessment_validation
    if notice_assessment.attached? && !notice_assessment.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:notice_assessmen_format, "Youston, le format n'est pas le bon !")
    end
  end

  def student_card_validation
    if student_card.attached? && !student_card.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:student_card_format, "Youston, le format n'est pas le bon !")
    end
  end

  def residency_permit_validation
    if residency_permit.attached? && !residency_permit.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:residency_permit_format, "Youston, le format n'est pas le bon !")
    end
  end

  def bank_identity_validation
    if bank_identity.attached? && !bank_identity.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:bank_identity_format, "Youston, le format n'est pas le bon !")
    end
  end
end
