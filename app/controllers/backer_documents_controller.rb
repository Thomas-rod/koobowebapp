class BackerDocumentsController < ApplicationController

  def destroy
    raise
    set_backer_document
    @backer_document.destroy
    redirect_to records_path, notice: "Votre document a bien été supprimé"
  end

  private

  def set_backer_document
    @backer_document = BackerDocument.find(params[:id])
  end

  def params_backer_document
    params.require(:backer_document).permit(:backer, :document)
  end
end
