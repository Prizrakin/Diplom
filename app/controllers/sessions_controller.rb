class SessionsController< ApplicationController
    def new

    end

    def create
        user = User.find_by email: params[:email]
        if user&.authenticate(params[:password])
            sign_in user
            redirect_to root_path
        else
            flash[:alert] = "Пошта або пароль вказані не вірно"
            redirect_to new_session_path
        end
    end

    def destroy
        sign_out
        redirect_to root_path
    end
end