Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPTCHA_PUBLIC_KEY']
  config.private_key = ENV['RECAPTCHA_PRIVATE_KEY']
  # Uncomment if you want to use the newer version of the API,
  # only works for versions >= 0.3.7:
  #config.api_version = 'v2'
end