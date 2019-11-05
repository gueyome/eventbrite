class UsersController < ApplicationController
  
  def show
    puts params
    puts a = params[:id]
    @user = User.find(a)
  end

end
