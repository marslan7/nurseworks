class SupportRequestTypesController < ApplicationController

  def new
    @support_request_type = SupportRequestType.new
  end

  def create
    @support_request_type = SupportRequestType.new(support_request_params)

    if @support_request_type.save
      flash[:notice] = "Successfully Created Support Request Type"
      redirect_to support_requests_path
    else
      render :new
    end
  end

  def destroy
    @support_request_type = SupportRequestType.find(params[:id])
    if @support_request_type.destroy
      flash[:notice] = "Support Request Type successfully deleted"
      redirect_to support_requests_path
    else
      render :new
    end
  end

  private

  def support_request_params
    params.require(:support_request_type).permit(:name)
  end
end
