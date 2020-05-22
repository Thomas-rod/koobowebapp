module RecordHelper


  #*------------------------------------*#
        #USER RECORDS
  #*------------------------------------*#

  def records_number_document_mandatory_attached(records)
    counter = 0
    records.each do |record|
      record.record_documents.each do |rd|
        (rd.document.title == "identity_card" && rd.document.destroy_by_user == nil) ? counter += 1 : ""
        (rd.document.title == "payslips" && rd.document.destroy_by_user == nil) ? counter += 1 : ""
        (rd.document.title == "proof_residence" && rd.document.destroy_by_user == nil)? counter += 1 : ""
      end
      # rd.document.docs.count == 3
    end
    return counter
  end

  def records_number_document_optional_attached(records)
    counter = 0
    records.each do |record|
      record.record_documents.each do |rd|
        (rd.document.title == "notice_assessment" && rd.document.destroy_by_user == nil) ? counter += 1 : ""
        (rd.document.title == "rent_receipts" && rd.document.docs.count == 3 && rd.document.destroy_by_user == nil) ? counter += 1 : ""
        (rd.document.title == "student_card" && rd.document.destroy_by_user == nil)? counter += 1 : ""
        (rd.document.title == "bank_identity" && rd.document.destroy_by_user == nil)? counter += 1 : ""
      end
    end
    return counter
  end

  #*------------------------------------*#
        #SPECIFIC TO DOCUMENT
  #*------------------------------------*#

  def record_document_attached?(record, file)
    !record.record_documents.select{ |rd| rd.document.title == file && rd.document.destroy_by_user == nil}.empty?
    # Here, i want to know if there is a document attached with type (CONSTANT IN RECORD DOCUMENT TITTLE)
    # and deleted_by_user is here to prevent a deleted file from a renting to be persistant in DB.
  end

  def record_document_attached(record, file)
    record.record_documents.select{ |rd| rd.document.title == file && rd.document.destroy_by_user == nil}.first
  end

  def backer_document_attached?(backer, file)
    !backer.backer_documents.select{ |bd| bd.document.title == file && bd.document.destroy_by_user == nil}.empty?
  end

  def backer_document_attached(backer, file)
    backer.backer_documents.select{ |bd| bd.document.title == file && bd.document.destroy_by_user == nil}.first
  end

  #*------------------------------------*#
        #SPECIFIC TO DOCUMENT
  #*------------------------------------*#

  def find_record_document(record, file)
    record.record_documents.select{ |rd| rd.document.title == 'identity_card' && rd.document.destroy_by_user == nil}.first.document
  end
end
