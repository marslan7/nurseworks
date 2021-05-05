class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]
  load_and_authorize_resource :except => ["index", "search"]

  # GET /users or /users.json
  def index
    @users = User.accessible_by(current_ability)
  end

  def search
    @users = User.search(params[:query])
    render "index"
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if @user.bio.blank?
      @user.bio = " #{@user.full_name} - Hired YYYY <br>
      Year of Birth - YYYY <br>
      Caregiver - XX+ years <br>
      State License - <br>
      Criminal Background - None <br>
      Contact number - #{@user.phone} <br>
      <br>
      <br>
      Brief Summary Here
      "
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.role = "User" if (current_user && current_user.role != "Admin")
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    # Default the role to user to prevent priv escalation    
    up = user_params
    if current_user.role != "Admin"
      up[:role] = "User" 
      # logger.debug  "user_params = #{up}"
    end

    respond_to do |format|
      if @user.update(up)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role, 
        :emergency_contact_name, :emergency_contact_phone, :profile_image, :bio, :phone)
    end
end
