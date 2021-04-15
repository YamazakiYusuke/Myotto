class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  process resize_to_fit: [50, 50]

  version :thumb do
    process resize_to_fill: [120, 120]
  end

  def default_url(*args)
    "default.png"
  end
end
