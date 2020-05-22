module DocumentHelper
  def document_in_renting?(tenant)
    #Select renting linked to a renting_folder from the tenant
    # Check if the document is present in renting_document
    rentings_tenant = Renting.all.select{ |r| r.renting_folder.visit.user == tenant }
    return false if rentings_tenant.empty?
    rentings_tenant.each do |r|
      if r.renting_documents.document == document
        return true
      end
    end
  end
end
