class LotsController < ApplicationController
  def index
    begin

      args = params.select{|key,value| key.in?(Lot.column_names())}
      if params.has_key?(:min_longitude) && params.has_key?(:max_longitude)
        args[:longitude] = params[:min_longitude]..params[:max_longitude]
      end
      if params.has_key?(:min_latitude) && params.has_key?(:max_latitude)
        args[:latitude] = params[:min_latitude]..params[:max_latitude]
      end
      @lots = Lot.where(args)
      render template: 'lots/index', status: :ok
    rescue Exception => e
      Rails.logger.error("Encountered an error while indexing  #{e}")
      render json: {:message=> e.to_s}.to_json, status: :not_found
    end
  end
  def create
    begin
      @merchant = Merchant.find(params[:merchant_id])
      @lot = @merchant.lots.create!(params.select{|key,value| key.in?(Lot.column_names())})
      render template: 'lots/show', status: :created
    rescue Exception => e
      render json: {:message=> e.to_s}.to_json, status: :internal_server_error
     # Rails.logger.error("Encountered an error while creating a lot  #{e}")
    end
  end
  def show
    begin
      @lot = Lot.find(params[:id])
      render template: 'lots/show',  status: :ok
    rescue Exception => e
      render json: {:message=> e.to_s}.to_json, status: :not_found
    end
  end

end
