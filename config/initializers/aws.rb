
require 'aws-sdk'

# Rails.configuration.aws is used by AWS, Paperclip, and S3DirectUpload
#Rails.configuration.aws = YAML.load(ERB.new(File.read("#{Rails.root}/config/aws.yml")).result)[Rails.env].symbolize_keys!
#AWS.config(logger: Rails.logger)
#AWS.config(Rails.configuration.aws)

#AWS.config(access_key_id: ENV['AWS_ACCESS_KEY_ID'], 
  #         secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], 
   #        bucket: ENV['S3_BUCKET_NAME'],
    #       region: ENV['S3'],
     #      url: "https://soundcraft.com.s3.amazonaws.com/"
      #     )
     #      
           

