class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
  before_action :configure_permitted_parameters, if: :devise_controller?
  # デバイス機能実行前にconfigure_permitted_parametersの実行をする。

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end
