class RecordsController < ApplicationController
  before_action :notif_visit, :notif_counter, :set_record

  def show

  end

  def update
    if params[:record].nil?
      redirect_to record_path(@record), alert: "Attention, tu dois sélectionner un fichier Youston"
    else
      @record.send(which_document_upload).attach(params[:record][which_document_upload.to_sym])
      if @record.update(record_params)
        redirect_to record_path(@record), notice: "Super, ton fichier a bien été téléchargé Youston"
      else
        redirect_to record_path(@record), alert: @record.errors.messages["#{which_document_upload}_format".to_sym].first
      end
    end
  end

  def purge_document_record
    set_record
    unless params[:file].nil?

      unless params[:file_position].nil?
        file = params[:file]
        file_position = params[:file_position]
        @record.send(file)[file_position.to_i].purge
        redirect_to record_path(@record), notice: "C'est bon, le document a été supprimé !"
      else
        file = params[:file]
        @record.send(file).purge
        redirect_to record_path(@record), notice: "C'est bon, le document a été supprimé !"
      end
    else
      redirect_to record_path(@record), alert: "Jeff, on a un soucis. Contacte nous par mail bokoo@koobo.co"
    end
  end


  private

  def set_record
    @record = Record.find(current_user.record.id)
  end

  def record_params
    params.require(:record).permit(:user, :identity_card, :proof_residence, :notice_assessment, :student_card, :rent_receipts, :bank_identity, payslips: [])
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
