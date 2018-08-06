class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(first_name: params[:session]["first_name"], last_name: params[:session]["last_name"], email: params[:session]["email"], password: params[:session]["password"], password_confirmation: params[:session]["password_confirmation"])
    if
      @user.save
      log_in @user
      flash[:danger] = "Tu as bien été connecté.e !"
      redirect_to :action=>"show", :controller=>"sessions", :id=>"#{@user.id}"
    else flash[:danger] = "Tu t'es trompé.e dans la confirmation de ton mot de passe. Recommence ton inscription."
      render 'new'
    end
  end


end
