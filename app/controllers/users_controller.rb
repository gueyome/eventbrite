class UsersController < ApplicationController
  before_action :authenticate_user, :good_user_connected, only: [:show]

  
  
  def show
    puts params
    puts a = params[:id]
    @user = User.find(a)
  end

  def destroy
    a = params[:id]
    @user = User.find(a)
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private

  def authenticate_user
    unless current_user
      flash[:notice] = "Merci de vous connecter"
      redirect_to new_user_session_path
    end
  end

  def good_user_connected
    unless current_user == User.find(params[:id]) || current_user.is_admin == true
      flash[:error] = "Vous n'avez pas accès à cette page de profil"
      redirect_to events_path
    end
  end

end
