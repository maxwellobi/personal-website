class Sudo::LoginController < AdminController

    def index
        redirect_to root_url if session[:user_id]
        @user = User.new
    end

    def create
        
        @user = User.find_by_email(_login_params[:email])
        if @user && @user.password == _login_params[:password]

            session[:user_id] = @user.id
            
            if session[:return_url] 
                redirect_to session[:return_url] 
            else 
                redirect_to root_url 
            end

        else
            @user ||= User.new(_login_params)
            flash.now[:danger] = "Invalid Credentials"
            render 'index'
        end
    end

    def destroy
        session[:user_id] = nil
        reset_session
        redirect_to root_url 
    end

    private 
        def _login_params
            params.require(:user).permit(:email, :password)
        end
end

# index, new, create, edit, show, destroy