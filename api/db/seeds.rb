require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

FactoryBot.definition_file_paths = [ Rails.root.join('spec', 'factories') ]
FactoryBot.reload

table_names = %w(
  users
  works
)

table_names.each do |table_name|
  path = Rails.root.join("db/seeds/#{Rails.env}/#{table_name}.rb")

  # ファイルが存在しない場合はdevelopmentディレクトリを読み込む
  path = path.sub(Rails.env, "development") unless File.exist?(path)

  puts "#{table_name}..."
  require path
end
