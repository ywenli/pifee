class Api::V1::S3Controller < ApplicationController
  def presigned_url
    presigned_object = S3_BUCKET.presigned_post(
      key: "body_image/#{SecureRandom.uuid}/#{params[:filename]}",
      success_action_status: '201',
      acl: 'public-read'
    )
    render json: { url: presigned_object.url, fields: presigned_object.fields }
  end
end
