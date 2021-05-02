class UserDocsController < ApplicationController
  #before_action :set_user_doc, only: %i[ show edit update destroy ]
  load_and_authorize_resource :except => ["index"]


  # GET /user_docs or /user_docs.json
  def index
    @user_docs = UserDoc.accessible_by(current_ability)
  end

  # GET /user_docs/1 or /user_docs/1.json
  def show
  end

  # GET /user_docs/new
  def new
    @user_doc = UserDoc.new
  end

  # GET /user_docs/1/edit
  def edit
  end

  # POST /user_docs or /user_docs.json
  def create
    @user_doc = UserDoc.new(user_doc_params)
    @user_doc.user_id = current_user.id

    respond_to do |format|
      if @user_doc.save
        format.html { redirect_to @user_doc, notice: "User doc was successfully created." }
        format.json { render :show, status: :created, location: @user_doc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_docs/1 or /user_docs/1.json
  def update
    respond_to do |format|
      if @user_doc.update(user_doc_params)
        format.html { redirect_to @user_doc, notice: "User doc was successfully updated." }
        format.json { render :show, status: :ok, location: @user_doc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_docs/1 or /user_docs/1.json
  def destroy
    @user_doc.destroy
    respond_to do |format|
      format.html { redirect_to user_docs_url, notice: "User doc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_doc
      @user_doc = UserDoc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_doc_params
      params.require(:user_doc).permit(:doc_type, :description, :attachment)
    end
end
