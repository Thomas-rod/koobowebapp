module BackerHelper

  def backers_number_document_attached(backers)
    counter = 0
    backers.each do |backer|
      backer.identity_card.attached? ? counter += 1 : ""
      backer.proof_residence.attached? ? counter += 1 : ""
      backer.proof_work.attached? ? counter += 1 : ""
      backer.proof_revenue.attached? ? counter += 1 : ""
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
end
