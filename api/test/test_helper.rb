ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # プロセスが分岐した直後に呼び出し
  parallelize_setup do |worker|
    load Rails.root.join('db/seeds.rb')
  end

  # Run tests in parallel with specified workers
  # number_of_processors: 使用しているマシン(Docker)のコア数が入る
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  def active_user
    User.find_by(activated: true)
  end

  def api_url(path = "/")
    "#{ENV["BASE_URL"]}/api/v1/#{path}"
  end

  # コントローラーのJSONレスポンスを受け取る
  # @return [Srting] JSONレスポンス
  def response_body
    JSON.parse(@response.body)
  end
end
