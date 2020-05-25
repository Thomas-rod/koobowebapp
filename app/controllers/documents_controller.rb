class DocumentsController < ApplicationController
  def create
    @document = Document.new(params_document)
    if params[:document][:docs].nil?
      redirect_to records_path, alert: "Attention, tu dois sélectionner un fichier Youston"
    else
      params[:document][:docs].is_a?(Array) ? @document.multiple = true : @document.multiple = false
      attach_document
      if @document.save
        if params[:backer].nil?
          RecordDocument.create(record: Record.find(params[:record]), document: @document)
        else
          BackerDocument.create(backer: Backer.find(params[:backer]), document: @document)
        end
        redirect_to records_path, notice: "Félicitation, votre document a été créé"
      else
        redirect_to records_path, alert: @document.errors.messages[:docs_format].first
      end
    end
  end

  def destroy
    set_document
    @document.docs.purge
    @document.destroy
    redirect_to records_path, notice: 'Votre document a bien été supprimé'
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def params_document
    params.require(:document).permit(:title, :destroy_by_user, :multiple, docs: [])
  end

  def attach_document
    if params[:document][:docs].is_a?(Array)
      documents_to_attached = params[:document][:docs]
      documents_to_attached.each_with_index do |doc, index|
        file_name = documents_to_attached[index].original_filename
        content_type = documents_to_attached[index].content_type
        @document.docs.attach(io: doc, filename: file_name, content_type: content_type)
      end
    else
      document_to_attached = params[:document][:docs]
      file_name = document_to_attached.original_filename
      content_type = document_to_attached.content_type
      @document.docs.attach(io: document_to_attached, filename: file_name, content_type: content_type)
    end
  end
end

