class StaticpagesController < ApplicationController

  def index

  end

  def club
  end

  def secret_page
    @array_users = []
    if logged_in? == false
      flash[:danger] = "Il faut être connecté.e pour voir le Club Privé !"
      redirect_to '/login'
    else
      puts User.all
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
