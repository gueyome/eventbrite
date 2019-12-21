class UsersController < ApplicationController
  before_action :authenticate_user, :good_user_connected, only: [:show]

  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
        format.html { 
          flash[:success] = "Your profile has been modified"
          redirect_to @user }
        format.json {}
      else
        format.html { 
          flash[:error] = @user.errors.full_messages.first
          render :edit }
        format.json {}
      end
    end
  end



  private

  def authenticate_user
    unless current_user
      flash[:notice] = "Please login"
      redirect_to new_user_session_path
    end
  end

  def good_user_connected
    unless current_user == User.find(params[:id]) || current_user.is_admin == true
      flash[:error] = "You do not have access to this profile page"
      redirect_to events_path
    end
  end

end
