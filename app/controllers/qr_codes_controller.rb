include SecureRandom
class QrCodesController < ApplicationController
  before_action :set_qr_code, only: [:show, :edit, :update, :destroy]

  # GET /qr_codes
  # GET /qr_codes.json
  def index
    @qr_codes = QrCode.all
  end

  # GET /qr_codes/1
  # GET /qr_codes/1.json
  def show
  end

  # GET /qr_codes/new
  def new
    @qr_code = QrCode.new
  end

  # GET /qr_codes/1/edit
  def edit
  end

  # POST /qr_codes
  # POST /qr_codes.json
  def create
    @qr_code = QrCode.new(qr_code_params)

    respond_to do |format|
      if @qr_code.save
        format.html { redirect_to @qr_code, notice: 'Qr code was successfully created.' }
        format.json { render :show, status: :created, location: @qr_code }
      else
        format.html { render :new }
        format.json { render json: @qr_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qr_codes/1
  # PATCH/PUT /qr_codes/1.json
  def update
    respond_to do |format|
      if @qr_code.update(qr_code_params)
        format.html { redirect_to @qr_code, notice: 'Qr code was successfully updated.' }
        format.json { render :show, status: :ok, location: @qr_code }
      else
        format.html { render :edit }
        format.json { render json: @qr_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qr_codes/1
  # DELETE /qr_codes/1.json
  def destroy
    @qr_code.destroy
    respond_to do |format|
      format.html { redirect_to qr_codes_url, notice: 'Qr code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def checkin
    qr_code = QrCode.find_by(:code => params[:uuid])
    respond_to { |format|
      if not qr_code.nil?
        participant = qr_code.participant
        participant.update_attribute(:attended, true)
        checkin_response = {event: qr_code.event.name, participant: participant.name}
        format.json { render json: checkin_response, status: :ok }
      else
        format.json { render json: @qr_code.errors, status: :not_found }
      end
    }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_qr_code
    @qr_code = QrCode.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def qr_code_params
    params.require(:qr_code).permit(:code, :event_id, :participant_id)
  end
end
