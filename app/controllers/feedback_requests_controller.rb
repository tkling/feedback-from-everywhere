class FeedbackRequestsController < ApplicationController
  before_action :set_feedback_request, only: [:show, :edit, :update, :destroy]

  # GET /feedback_requests
  # GET /feedback_requests.json
  def index
    @feedback_requests = FeedbackRequest.all
  end

  # GET /feedback_requests/1
  # GET /feedback_requests/1.json
  def show
  end

  # GET /feedback_requests/new
  def new
    @feedback_request = FeedbackRequest.new
    @feedback = Feedback.new
  end

  # GET /feedback_requests/1/edit
  def edit
  end

  # POST /feedback_requests
  # POST /feedback_requests.json
  def create
    @feedback_request = FeedbackRequest.new(feedback_request_params)

    respond_to do |format|
      if @feedback_request.save
        format.html { redirect_to @feedback_request, notice: 'Feedback request was successfully created.' }
        format.json { render :show, status: :created, location: @feedback_request }
      else
        format.html { render :new }
        format.json { render json: @feedback_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedback_requests/1
  # PATCH/PUT /feedback_requests/1.json
  def update
    respond_to do |format|
      if @feedback_request.update(feedback_request_params)
        format.html { redirect_to @feedback_request, notice: 'Feedback request was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback_request }
      else
        format.html { render :edit }
        format.json { render json: @feedback_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_requests/1
  # DELETE /feedback_requests/1.json
  def destroy
    @feedback_request.destroy
    respond_to do |format|
      format.html { redirect_to feedback_requests_url, notice: 'Feedback request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_request
      @feedback_request = FeedbackRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_request_params
      params.require(:feedback_request).permit(:name, :email, :manager_email, :feedback_id)
    end
end
