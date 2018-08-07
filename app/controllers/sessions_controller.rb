class SessionsController < ApplicationController
  def show
    if logged_in? == false
      flash.now[:danger] = "Il faut être connecté.e pour voir le Club Privé !"
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

  def show_secret
    puts params[:id]
    current_user
    puts @current_user.id
  #@user = User.find(params[:id])
    #puts @user.id
    if logged_in? == false
      flash.now[:danger] = "Il faut être connecté.e pour voir ton profil du Club Privé !"
      render 'new'
    else @user = User.find(params[:id])
      @user_first_name = @user.first_name
      @user_last_name = @user.last_name
      @user_email = @user.email
    end
  end

  def secret_page
    @array_users = []
    if logged_in? == false
      flash[:danger] = "Il faut être connecté.e pour voir le Club Privé !"
      redirect_to '/login'
    else
      params[:id] = @current_user.id
      #puts params[:id]
      User.all.each do |user|
      array = []
      array << user.first_name
      array << user.last_name
      array << user.email
      @array_users << array
    end
    end
  end

end
