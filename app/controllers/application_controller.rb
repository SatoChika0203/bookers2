class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top]
    # 全てのアクションの前に、ユーザーがログインしているかどうか確認する（topアクション省く）
    
    # deviseのコントローラーは修正できないため、全てのコントローラーに対する処理を行えるApplicationControllerに記述する
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    
    #ログイン後のリダイレクト先の指定
    def after_sign_in_path_for(resource)
      flash[:notice]="Signed in successfully."
      user_path(current_user.id)
    end 
    
    #ログアウト後のリダイレクト先の指定
    def after_sign_out_path_for(resource)
      flash[:notice]="Signed out successfully."
      root_path
    end
     
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    end
# devise_parameter_sanitizer.permitメソッド:ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可

end
