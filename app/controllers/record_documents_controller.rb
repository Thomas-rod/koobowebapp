class RecordDocumentsController < ApplicationController

  def destroy
    set_record_document
    @record_document.destroy
    redirect_to records_path, notice: "Votre document a bien été supprimé"
  end

  private

  def set_record_document
    @record_document = RecordDocument.find(params[:id])
  end

  def params_record_document
    params.require(:record_document).permit(:record, :document)

  end


end
