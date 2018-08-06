class SessionsController < ApplicationController
  def show
    if logged_in? == false
      flash.now[:danger] = "Il faut être connecté.e pour voir le secret de l'Univers !"
      render 'new'
    end
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to :action=>"show", :controller=>"sessions", :id=>"#{@user.id}"
    else
      flash[:danger] = "Il y a eu une erreur d'adresse mail ou de mot de passe !"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:danger] = "Vous avez été déconnecté.e ! 🙄 😁 🙃 😎"
    redirect_to root_url
  end

end
