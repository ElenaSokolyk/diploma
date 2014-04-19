class Document < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  belongs_to :article
end
