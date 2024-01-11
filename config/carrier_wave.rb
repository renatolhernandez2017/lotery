# frozen_string_literal: true

CarrierWave.configure do |config|
  config.fog_provider    = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAIUYX6EGZ5TIO3BIA',
    aws_secret_access_key: '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',
    region:                'us-east-2'
  }

  config.storage       = :fog
  config.fog_directory = 'dsop-plataforma'
  config.fog_public    = true
end

if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage           = :file
    config.enable_processing = false
  end
end
