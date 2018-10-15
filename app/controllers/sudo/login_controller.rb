class Sudo::LoginController < AdminController

    def index
        @user = User.new
    end

    def create
        
        @user = User.find_by_email(_login_params[:email])
        if @user && @user.password == _login_params[:password]

            session[:user_id] = @user.id
            redirect_to '/'
        else
            @user ||= User.new(_login_params)
            flash.now[:danger] = "Invalid Credentials"
            render 'index'
        end
    end

    private 
        def _login_params
            params.require(:user).permit(:email, :password)
        end
end

# index, new, create, edit, show, destroy