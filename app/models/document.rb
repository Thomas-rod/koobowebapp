class Document < ApplicationRecord
TITTLE = %w(identity_card payslips proof_residence notice_assessment rent_receipts student_card bank_identity proof_work proof_revenue)

has_one :record_document, dependent: :destroy
has_one :backer_document, dependent: :destroy
has_one :renting_documents

has_many_attached :docs

validates :title, inclusion: {in: TITTLE}
validates :title, presence: true

# validate :document_attached

private

  def document_attached
    if docs.count == 1 && !docs.first.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:docs_format, "Le format n'est pas le bon ! Essaye à nouveau")
    else
      docs.each do |doc|
        unless doc.content_type.in?(%w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document))
          errors.add(:docs_format, "Le format n'est pas le bon ! Essaye à nouveau")
        end
      end
    end
  end
end
