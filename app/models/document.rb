class Document < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  belongs_to :article
  
  def to_jq_uploader
    { id: id, name: filename, size: file.size, url: file.thumb.url, image: file.image? }
  end

  def filename
    File.basename(file.url)
  end
end
