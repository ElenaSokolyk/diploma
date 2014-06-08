class Document < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  belongs_to :article
  
  def to_jq_uploader
    { id: id, name: filename, size: file.size, url: file.thumb.url, image: file.image?, icon: decorate.document_icon }
  end

  def filename
    URI::decode(File.basename(file.url))
  end
  
  def document_type
    file.image? ? 'image' : file.file.extension.downcase
  end
end
