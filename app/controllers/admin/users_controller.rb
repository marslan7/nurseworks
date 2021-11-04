class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit;end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Password was changed successfully.'
      redirect_to users_path
    else
      render :edit
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :earnings, :deactivated,
      :emergency_contact_name, :emergency_contact_phone, :profile_image, :bio, :phone, :password, :password_confirmation)
  end

end