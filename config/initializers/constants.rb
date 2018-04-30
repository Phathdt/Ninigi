EXPIRED_TIME = 1.month.to_i

TOKEN_LENGTH = 192

MODEL_SERIALIZER = %w[User Restaurant AlbumImage ManagerRequest Dish Review].freeze

DESC_MAX_LENGTH = 3000

ROLES = %w[admin owner manager].freeze

KAMINAGI_PER_PAGE = 20

MAX_FIZESIZE = 10.megabytes.freeze

WHITELIST_EXTS = %w(jpg jpeg png bmp).freeze

CONTENT_TYPE_PATTERN = /image\/(jpe?g|png|bmp)$/

AASM_MODEL = %w[Restaurant ManagerRequest].freeze
