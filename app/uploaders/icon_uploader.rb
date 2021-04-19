class IconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  process resize_to_fit: [512, 512]

  def default_url(*args)
    "default.png"
  end
end
