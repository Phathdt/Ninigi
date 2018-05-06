class Upload < ApplicationRecord
  has_attached_file :file

  validates_attachment :file, size: { in: 0..MAX_FIZESIZE },
    content_type: { content_type: CONTENT_TYPE_PATTERN }
end
