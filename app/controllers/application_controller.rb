class ApplicationController < ActionController::Base
    
    
    # deviseのコントローラーは修正できないため、全てのコントローラーに対する処理を行えるApplicationControllerに記述する
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    
    def after_sign_in_path_for(resource)
     user_path(current_user.id)
    # なぜ@user?
    end 
    
    def after_sign_out_path_for(resource)
     root_path
    end
     
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    end
# devise_parameter_sanitizer.permitメソッド:ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可

end
