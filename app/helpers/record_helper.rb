module RecordHelper


  #*------------------------------------*#
        #USER RECORDS
  #*------------------------------------*#

  def records_number_document_mandatory_attached(records)
    counter = 0
    records.each do |record|
      record.identity_card.attached? ? counter += 1 : ""
      record.payslips.attached? && record.payslips.count == 3 ? counter += 1 : ""
      record.proof_residence.attached? ? counter += 1 : ""
    end
    return counter
  end

  def records_number_document_optional_attached(records)
    counter = 0
    records.each do |record|
      record.notice_assessment.attached? ? counter += 1 : ""
      record.student_card.attached? ? counter += 1 : ""
      record.rent_receipts.attached? && record.rent_receipts.count == 3 ? counter += 1 : ""
      record.bank_identity.attached? ? counter += 1 : ""
    end
    return counter
  end


  #*------------------------------------*#
        #SPECIFIC TO A RECORD
  #*------------------------------------*#

  def number_document_mandatory_attached(record)
    counter = 0
    record.identity_card.attached? ? counter += 1 : ""
    record.payslips.attached? && record.payslips.count == 3 ? counter += 1 : ""
    record.proof_residence.attached? ? counter += 1 : ""
    return counter
  end

  def number_document_optional_attached(record)
    counter = 0
    record.notice_assessment.attached? ? counter += 1 : ""
    record.student_card.attached? ? counter += 1 : ""
    record.rent_receipts.attached? && record.rent_receipts.count == 3 ? counter += 1 : ""
    record.bank_identity.attached? ? counter += 1 : ""
    return counter
  end

end
