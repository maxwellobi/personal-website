class Sudo::RegisterController < AdminController

  def index
    if User.all.size >= 1
      @current_user = User.first
      flash[:danger] = "User: #{@current_user.full_name} - #{@current_user.email} already exists! You cannot have more than one user."
      redirect_to sudo_login_url
    end
  end

  def create
    
    register_params = _register_params
    @user = User.new
    
    if register_params[:password] != register_params[:password_confirm]
        #password confirmation error
      flash.now[:danger] = "Password does not match confirm"
      return render 'index'
    end

    @user.email = register_params[:email]
    @user.password = register_params[:password]
    @user.full_name = register_params[:full_name]

    if @user.save
      #redirect to login page
      flash[:primary] = "New sudo account created - Login now"
      redirect_to sudo_login_url
    else 
      flash.now[:danger] = "Could not create sudo account" if !@user.errors.any?
      render 'index'
    end

  end

  private 
    def _register_params
      params.require(:register).permit(:email, :password, :password_confirm, :full_name)
    end

end