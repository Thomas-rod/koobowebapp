module Zapier
  class FlatCreation < Zapier::Base
    def call_operation
      HTTParty.post("https://hooks.zapier.com/hooks/catch/7151720/ori1n2u/", body: params)
    end

    def params
      {
        flat_user_first_name: resource.user.first_name,
        flat_user_email: resource.user.email,
        flat_user_id: resource.user.id,
        foat_photos: photos_array(resource),
        flat_id: resource.id
      }
    end

    def photos_array(flat)
      photos = []
      flat.photos.each do |photo|
        photos << "https://s3.console.aws.amazon.com/s3/object/#{ENV["S3_BUCKET_NAME"]}/#{photo.key}?region=#{ENV["AWS_REGION"]}"
      end
      return photos
    end
  end
end
