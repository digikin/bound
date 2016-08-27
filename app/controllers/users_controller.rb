class UsersController < ApplicationController

  def index
    @users = User.order(:name).to_a
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email_address))
    if @user.save
      redirect_to users_path, :notice => "An invite has been sent to #{@user.email_address}"
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      return redirect_to users_path, :alert => "You cannot revoke your own access"
    end
    @user.destroy
    redirect_to users_path, :notice => "#{@user.description} has been removed successfully"
  end

end
