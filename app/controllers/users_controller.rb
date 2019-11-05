class UsersController < ApplicationController
  before_action :authenticate_user, :good_user_connected, only: [:show]

  def show
    puts params
    puts a = params[:id]
    @user = User.find(a)
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Merci de vous connecter"
      redirect_to new_user_session_path
    end
  end

  def good_user_connected
    unless current_user == User.find(params[:id])
      flash[:danger] = "Vous n'avez pas accès à cette page de profil"
      redirect_to events_path
    end
  end

end
