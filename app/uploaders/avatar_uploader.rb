class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick


  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "carrierwave-test-siruku6/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [200, 200]
end
