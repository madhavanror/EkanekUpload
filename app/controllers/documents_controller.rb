class DocumentsController < ApplicationController
  before_action :logged_in?
  include ActiveStorage::Streaming
  before_action do
    ActiveStorage::Current.url_options = request.base_url
  end

  def download
    @document = Document.find_by_id(params[:id])
    if @document
      http_cache_forever(public: true) do
        send_blob_stream @document.doc, disposition: 'attachment'
      end
    else
      redirect_to documents_path, flash: { notice: 'No Preview Available' }, status: 404
    end
  end

  def index
    @documents = current_user.documents
  end

  def new
    @document = current_user.documents.build
  end

  def create
    @document = current_user.documents.build(doc_params)
    if @document.save
      redirect_to documents_path
    else
      render 'new'
    end
  end

  def destroy
    @document = Document.find_by_id(params[:id])
    if @document.present?
      @document.destroy
      redirect_to documents_path, flash: { notice: 'Successfully deleted.' }
    else
      redirect_to documents_path, flash: { notice: 'Sorry! Not able to destroy Document Referred' }, status: 404
    end
  end

  private

  def doc_params
    params.require(:document).permit(:title, :description, :doc)
  end
end
