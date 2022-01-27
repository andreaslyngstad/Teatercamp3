class UsersController < ApplicationController

      def new
      @user = User.new
    end



  user = User.first
  if user.nil?
  skip_before_filter :login_required?
  end

  def index
    @users = User.all
    if !params[:id].blank?
      @user = User.find(params[:id])
      else params[:id].blank?
      @user = User.new
    end
  end
  # render new.rhtml

  def edit
    @user = User.find(params[:id])
    render( :view => "index")
  end

  def create
    @users = User.all
    @user = User.new(user_params)
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button.Uncomment if you understand the tradeoffs.
      # reset session

      redirect_to(users_path)
      flash[:notice] = "Ny bruker lagt til!"
    else
      flash[:error]  = "Hei. Vi kunne ikke lage kontoen. Det er viktig at du skriver riktig navn og epost og har et brukernavn mellom 3 og 40 karakterer."
      render :action => 'index'
    end
  end

  def update
    @user = User.find(params[:id])
        respond_to do |format|
          if @user.update_attributes(user_params)
            flash[:notice] = 'Brukeren ble oppdatert'
            format.html { redirect_to(:action => "index") }
            format.xml  { head :ok }
          else
            format.html { render :action => "index" }
            format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
          end
      end
  end
  def destroy
    @user = User.find(params[:id])
    @users = User.all
    if @users.length > 1
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
    end
  else
  flash[:notice] = "Sletter du den siste brukeren kommer du ikke inn igjen!!"
      render :action => 'index'
  end
end

def user_params
    params.require(:user).permit(:login, :email, :first_name, :last_name, :password, :password_confirmation)
  end

end
