class ApplicationController < ActionController::API
  # Rails API モードのデフォルトでは Cookies を扱えないため、Cookies モジュールを追加
  include ActionController::Cookies
  include UserAuth::Authenticator
end
