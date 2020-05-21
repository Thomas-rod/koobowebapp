class RecordsController < ApplicationController
  before_action :notif_visit, :notif_counter

  def index
    @record = Record.new
    @records = Record.all.select{|r| r.user == current_user}.sort_by{ |r| r[:created_at]}
    @backer = Backer.new()
    @backers = []
    @records.each do |record|
      unless record.backer.nil?
        @backers << record.backer
      end
    end
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user
    if @record.save
      redirect_to records_path, notice: "Tu as ajouté un nouveau locataire pour ton dossier"
    else
      redirect_to records_path, alert: "Attention il y a une erreur dans la personne que tu as voulu ajouter"
    end
  end

  def update
    set_record
    if params[:record].nil?
      redirect_to records_path, alert: "Attention, tu dois sélectionner un fichier Youston"
    else
      @record.send(which_document_upload).attach(params[:record][which_document_upload.to_sym])
      if @record.update(record_params)
        redirect_to records_path, notice: "Super, ton fichier a bien été téléchargé Youston"
      else
        redirect_to records_path, alert: @record.errors.messages["#{which_document_upload}_format".to_sym].first
      end
    end
  end

  def destroy
    set_record
    @record.destroy
    redirect_to records_path, notice: "La personne que tu as ajouté a été enlevé"
  end

  def purge_document_record
    set_record
    unless params[:file].nil?
      unless params[:file_position].nil?
        file = params[:file]
        file_position = params[:file_position]
        @record.send(file)[file_position.to_i].purge
        redirect_to records_path, notice: "C'est bon, le document a été supprimé !"
      else
        file = params[:file]
        @record.send(file).purge
        redirect_to records_path, notice: "C'est bon, le document a été supprimé !"
      end
    else
      redirect_to records_path, alert: "Jeff, on a un soucis. Contacte nous par mail bokoo@koobo.co"
    end
  end




  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:user, :first_name, :last_name, :email, :phone_number, :identity_card, :proof_residence, :notice_assessment, :student_card, :rent_receipts, :bank_identity, payslips: [])
  end

  def which_document_upload
    if !params[:record][:identity_card].nil?
      return "identity_card"
    elsif !params[:record][:payslips].nil?
      return "payslips"
    elsif !params[:record][:proof_residence].nil?
      return "proof_residence"
    elsif !params[:record][:notice_assessment].nil?
      return "notice_assessment"
    elsif !params[:record][:rent_receipts].nil?
      return "rent_receipts"
    elsif !params[:record][:student_card].nil?
      return "student_card"
    elsif !params[:record][:bank_identity].nil?
      return "bank_identity"
    else
      raise
    end
  end

  def notif_counter
    @counter_appartement = 0
    @counter_calendar = notif_visit.length
    @counter_document = 0
    @counter_accounting = 0
    @counter_profil = 0
    @counter = @counter_appartement + @counter_calendar + @counter_document + @counter_accounting + @counter_profil
    return @counter
  end

  def notif_visit
    pending_visit_all = Visit.where('status LIKE ?', 'pending')
    visit_pending_flat = []
    pending_visit_all.each do |visit|
      if visit.schedule.flat.user.id == current_user.id
       visit_pending_flat << visit
      end
    end
    return visit_pending_flat
  end
end
