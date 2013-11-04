class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show,  :update, :destroy]

  # GET /merchants
  # GET /merchants.json
  def index
    begin
      @merchants = Merchant.where(merchant_params)

      render template: 'merchants/index', status: :ok
    rescue Exception => e
      render json: {:message=> e.to_s}.to_json, status: :not_found
    end
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
    begin
      @merchant = Merchant.find(params[:id])
      render template: 'merchants/show',  status: :ok
    rescue Exception => e
      render json: {:message=> e.to_s}.to_json, status: :not_found
    end
  end



  # POST /merchants
  # POST /merchants.json
  def create
    begin
      @merchant = Merchant.create!(merchant_params)
      render template: 'merchants/show', status: :created
    rescue Exception => e
      render json: {:message=> e.to_s}.to_json, status: :internal_server_error
    end

  end

  # PATCH/PUT /merchants/1
  # PATCH/PUT /merchants/1.json
  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to @merchant, notice: 'Merchant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html { redirect_to merchants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_params
      params.select{|key,value| key.in?(Merchant.column_names())}
    end
end
