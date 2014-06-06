class DocumentsController < ApplicationController
  skip_before_filter :remove_unrelated_documents
  
  def create
    document = Document.create(document_params)
    render json: { file: document.to_jq_uploader, content_type: 'application/json' }, status: 200
  end
  
  def destroy
    Document.find(params[:id]).destroy
    render json: {ok: true}, status: 200
  end
  
  private
  
  def document_params
    { file: params[:documents][:file] }
  end
end