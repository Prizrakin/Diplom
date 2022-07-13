module Authentication
    extend ActiveSupport::Concern

    included do
        private 

        def current_user
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
        end

        def user_signed_in?
            current_user.present?
        end

        def sign_in(user)
            session[:user_id] = user.id
        end

        def sign_out
            session.delete :user_id
        end

        def current_right
            @current_right ||= Right.find_by(user_id: session[:user_id]).present? if user_signed_in?
        end

        def user_administrator?
            current_right.present?
        end

        def balance
            balance = User.find_by(id: session[:user_id])
            balance.balance
        end

        
        

        helper_method :current_user,:user_signed_in?,:user_administrator?,:balance
    end
end