module ApplicationHelper
  def document_download_style(document)
    style = "btn btn-sm btn-outline-primary"
    style += " disabled" if document.doc.blank?
    style
  end
end
