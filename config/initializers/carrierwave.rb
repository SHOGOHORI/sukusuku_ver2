require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'sukusukubucket'
    config.asset_host = 'https://s3.amazonaws.com/sukusukubucket'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: "AKIARCPUWMFE6BPS7FFE",
      aws_secret_access_key: "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"
      region: 'ap-northeast-1',
      path_style: true
    }
end
