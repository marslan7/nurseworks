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

  def assign_supporting_doc
    @assign_supporting_doc = AssignSupportingDoc.new
    @super_user = User.find_by(role: "Super User")
  end

  def assign_doc
    @assign_supporting_doc = current_user.admin_assign_supporting_docs.new(assign_supporting_doc_params)

    if @assign_supporting_doc.save
      flash[:notice] = "Successfully assign to #{@assign_supporting_doc.user.email}"
      redirect_to users_path
    else
      render :assign_supporting_doc
    end
  end

  def new_support_req_type
    @support_request = SupportRequest.new
  end

  def create_support_req_type
    @support_request = current_user.support_requests.new(support_request_params)

    if @support_request.save
      flash[:notice] = "Successfully Create Support Request Type"
      redirect_to support_requests_path
    else
      render :new_support_req_type
    end
  end

  def new_document_type
    @user_document = UserDoc.new
  end

  def create_document_type
    @user_document = current_user.user_docs.new(user_doc_params)

    if @user_document.save
      flash[:notice] = "Successfully Create Document Type"
      redirect_to user_docs_path
    else
      render :new_support_req_type
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

  def assign_supporting_doc_params
    params.require(:assign_supporting_doc).permit(:user_id, :support_request_id, :super_admin)
  end

  def support_request_params
    params.require(:support_request).permit(:req_type, :supporting_doc, :content, :closed)
  end

  def user_doc_params
    params.require(:user_doc).permit(:doc_type, :description, :attachment)
  end

end