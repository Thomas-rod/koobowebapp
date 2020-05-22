module BackerHelper

  def backers_number_document_attached(backers)
    counter = 0
    backers.each do |backer|
      backer.backer_documents.each do |bd|
        (bd.document.title == "identity_card" && bd.document.destroy_by_user == nil) ? counter += 1 : ""
        (bd.document.title == "proof_residence" && bd.document.destroy_by_user == nil) ? counter += 1 : ""
        (bd.document.title == "proof_work" && bd.document.destroy_by_user == nil) ? counter += 1 : ""
        (bd.document.title == "proof_revenue" && bd.document.destroy_by_user == nil) ? counter += 1 : ""
      end
    end
    return counter
  end

  def number_backer_document_attached(backer)
    counter = 0
    backer.identity_card.attached? ? counter += 1 : ""
    backer.proof_residence.attached? ? counter += 1 : ""
    backer.proof_work.attached? ? counter += 1 : ""
    backer.proof_revenue.attached? ? counter += 1 : ""
    return counter
  end

  #*------------------------------------*#
        #FIND BACKER DOCUMENT
  #*------------------------------------*#

  def find_backer_document(backer, file)
    backer.backer_documents.select{ |bd| bd.document.title == 'identity_card' && bd.document.destroy_by_user == nil}.first.document

  end
end
