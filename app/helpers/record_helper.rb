module RecordHelper
  def document_mandatory_attached?(record)

    # record.
  end

  def number_document_mandatory_attached(record)
    counter = 0
    record.identity_card.attached? ? counter += 1 : ""
    record.payslips.attached? == 3 ? counter += 1 : ""
    record.proof_residence.attached? ? counter += 1 : ""
    return counter
  end

  def document_optional_attached?(record)

    # record.
  end

  def number_document_optional_attached(record)
    counter = 0
    record.notice_assessment.attached? ? counter += 1 : ""
    record.student_card.attached? ? counter += 1 : ""
    record.rent_receipts.attached? == 3 ? counter += 1 : ""
    record.bank_identity.attached? ? counter += 1 : ""
    return counter
  end
end
