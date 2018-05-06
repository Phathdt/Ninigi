class Upload < ApplicationRecord
  has_attached_file :file

  after_create { delay(run_at: 7.days.from_now).destroy }

  validates_attachment :file, size: { in: 0..MAX_FIZESIZE },
    content_type: { content_type: CONTENT_TYPE_PATTERN }
end
