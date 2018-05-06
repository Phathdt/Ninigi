class UploadService < BaseService
  def create(params)
    upload = Upload.new(params)
    message = simple_create(upload, options)

    return [{
      id: upload.id,
      url: upload.file.url
    }, :ok] if message[:notice]

    [{ errors: message[:errors] }, :unprocessable_entity]
  end
end
