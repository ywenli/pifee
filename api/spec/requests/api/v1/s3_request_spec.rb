require 'rails_helper'
require 'aws-sdk-s3'

RSpec.describe 'Api::V1::S3', type: :request do
  let(:s3_contents) {
    [
      "url": 'https://pifee-body-image.s3.ap-northeast-1.amazonaws.com',
      "fields": {
        "key": 'xxx',
        "success_action_status": '201',
        "acl": 'public-read',
        "policy": 'xxx',
        "x-amz-credential": 'xxx',
        "x-amz-algorithm": 'xxx',
        "x-amz-date": 'xxx',
        "x-amz-signature": 'xxx'
      }
    ]
  }
  let(:client) { Aws::S3::Client.new(stub_responses: true) }
  # TODO: awsのstubでエラーが出るので修正する
  # before do
  #   client.stub_responses(:list_objects, contents: s3_contents)
  #   allow(s3).to receive(:presigned_url).and_return(s3_client)
  # end

  describe 'GET /api/v1/presigned-url #presigned_url' do
    xit 'presigned-urlが返ってくる' do
      # get '/api/v1/s3/presigned_url', params: {filename: 'hoge'}

      # expect(response).to have_http_status(:ok)
      # expect(response_body).to include
    end
  end
end
