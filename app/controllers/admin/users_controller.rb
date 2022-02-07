class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :get_user, only: %i[assign_supporting_doc assign_doc]

  def edit;end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Password was changed successfully.'
      redirect_to users_path
    else
      render :edit
    end
  end

  def new_document_type
    @document_type = DocumentType.new
  end

  def create_document_type
    @document_type = DocumentType.new(document_type_params)

    if @document_type.save
      flash[:notice] = "Successfully Create Document Type"
      redirect_to user_docs_path
    else
      render :new_document_type
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :earnings, :deactivated,
      :emergency_contact_name, :emergency_contact_phone, :profile_image, :bio, :phone, :password, :password_confirmation)
  end

  def document_type_params
    params.require(:document_type).permit(:name)
  end

  def user_doc_params
    params.require(:user_doc).permit(:doc_type, :description, :attachment)
  end

end