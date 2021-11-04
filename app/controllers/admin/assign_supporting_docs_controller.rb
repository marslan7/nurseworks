class Admin::AssignSupportingDocsController < ApplicationController

  def new
    @admin_assign_doc = AssignSupportingDoc.new
  end

  def create
    @assign_doc = current_user.admin_assign_supporting_docs.new(assign_doc_params)
    if @assign_doc.save
      flash[:notice] = "Document Assign #{@assign_doc.user.email}"
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def assign_doc_params
    params.require(:assign_supporting_doc).permit(:user_id, :support_request_id)
  end

end
