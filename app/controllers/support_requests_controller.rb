class SupportRequestsController < ApplicationController
  # before_action :set_support_request, only: %i[ show edit update destroy ]
  before_action :set_support_request, only: %i[ assign_requests admin_assign_requests ]
  before_action :support_request_types, only: %i[new edit destroy ]
  load_and_authorize_resource :except => ["index", "search"]

  # GET /support_requests or /support_requests.json
  def index
    @support_requests = SupportRequest.includes(:support_request_type).accessible_by(current_ability).page(params[:page])

    @support_requests = @support_requests.open if params[:open].present?
    @support_requests = @support_requests.closed if params[:closed].present?
    dir = params[:dir] || "desc"
    order_by = params[:order_by] || "support_requests.id"
    order_by += " " + dir
    @dir = (dir == "desc") ? "asc" : "desc"

    # time_of_notifications =  SupportRequest.include(:users).where("request_type = 6")

    @support_requests = @support_requests.includes(:user, :supporting_doc_blob).order(order_by)
  end

  def search
    if current_user.role == "Manager"
      @support_requests = SupportRequest.search(params[:query])
    else
      @support_requests = SupportRequest.search(params[:query], :with => {:id => current_user.id})
    end

    render "index"
  end

  # GET /support_requests/1 or /support_requests/1.json
  def show
  end

  # GET /support_requests/new
  def new
    @support_request = SupportRequest.new
    @support_request_type_id = SupportRequestType.where(name: 'Time off notification').pluck(:id)
  end

  # GET /support_requests/1/edit
  def edit
  end

  # POST /support_requests or /support_requests.json
  def create
    @support_request = SupportRequest.new(support_request_params)
    @support_request.user_id = current_user.id
    @support_request.start_date = Date.strptime(params[:support_request][:start_date], "%m-%d-%Y")
    @support_request.end_date = Date.strptime(params[:support_request][:end_date], "%m-%d-%Y")

    respond_to do |format|
      if @support_request.save
        format.html { redirect_to @support_request, notice: "Support request was successfully created." }
        format.json { render :show, status: :created, location: @support_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /support_requests/1 or /support_requests/1.json
  def update
    @support_request.updated_by = current_user
    respond_to do |format|
      if @support_request.update(support_request_params)
        format.html { redirect_to @support_request, notice: "Support request was successfully updated." }
        format.json { render :show, status: :ok, location: @support_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_requests
    @assign_request = AssignSupportRequest.new
    @super_users = User.where(role:"Super User")
  end

  def admin_assign_requests
    @assign_request = @support_request.assign_support_requests.new(assign_requests_params)
    @super_users = User.where.not(role:"User")

    if @assign_request.save
      redirect_to support_requests_url, notice: "Support Request Assign to #{ @assign_request.user.email }."
    else
      render "assign_requests"
    end
  end

  # DELETE /support_requests/1 or /support_requests/1.json
  def destroy
    @support_request.destroy
    respond_to do |format|
      format.html { redirect_to support_requests_url, notice: "Support request was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

    def assign_requests_params
      params.require(:assign_support_request).permit(:user_id, :support_request_id)
    end

    def support_request_types
      @super_user = User.find_by(role: "Super User")
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_support_request
      @support_request = SupportRequest.find(params[:support_request_id])
    end

    # Only allow a list of trusted parameters through.
    def support_request_params
      params.require(:support_request).permit(:req_type, :supporting_doc, :content, :closed, :start_date, :end_date, :support_request_type_id)
    end
end
