class BackersController < ApplicationController

  def create

    @backer = Backer.new(backer_params)
    @backer.record = Record.find(params[:record_id])
    if @backer.save
      redirect_to records_path, notice: "Ton garant a été créé ! A toi de jouer maintenant"
    else
      redirect_to records_path, notice: "Il y a eu un soucis !"
    end
  end

  def update
    set_backer
    if params[:backer].nil?
      redirect_to records_path, alert: "Attention, tu dois sélectionner un fichier Youston"
    else
      @backer.send(which_document_upload).attach(params[:backer][which_document_upload.to_sym])
      if @backer.update(backer_params)
        redirect_to records_path, notice: "Super, ton fichier a bien été téléchargé Youston"
      else
        redirect_to records_path, alert: @backer.errors.messages["#{which_document_upload}_format".to_sym].first
      end
    end
  end

  def purge_document_backer
    @backer = Backer.find(params[:backer_id].to_i)
    unless params[:file].nil?
      unless params[:file_position].nil?
        file = params[:file]
        file_position = params[:file_position]
        @backer.send(file)[file_position.to_i].purge
        redirect_to records_path, notice: "C'est bon, le document a été supprimé !"
      else
        file = params[:file]
        @backer.send(file).purge
        redirect_to records_path, notice: "C'est bon, le document a été supprimé !"
      end
    else
      redirect_to records_path, alert: "Jeff, on a un soucis. Contacte nous par mail bokoo@koobo.co"
    end
  end

  def destroy
    set_backer
    @backer.destroy
    redirect_to records_path, notice: "Ton garant a été supprimé"
  end

  private

  def set_backer
    @backer = Backer.find(params[:id])
  end

  def backer_params
    params.require(:backer).permit(:record, :first_name, :last_name, :email)
  end

  def which_document_upload
    if !params[:backer][:identity_card].nil?
      return "identity_card"
    elsif !params[:backer][:proof_residence].nil?
      return "proof_residence"
    elsif !params[:backer][:proof_work].nil?
      return "proof_work"
    elsif !params[:backer][:proof_revenue].nil?
      return "proof_revenue"
    else
      raise
    end
  end
end
