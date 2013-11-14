class LotsController < ApplicationController
  def index
    begin

      args = params.select{|key,value| key.in?(Lot.column_names())}
      if params.has_key?(:nelat) && params.has_key?(:nelng) && params.has_key?(:swlat) && params.has_key?(:swlng)
        lng = [params[:swlng], params[:nelng]]
        lat = [params[:swlat], params[:nelat]]
        args[:longitude] = lng.min..lng.max
        args[:latitude] = lat.min..lat.max
      end
      if  params.has_key?(:curloc) && params.has_key?(:radius)
        @lots = Lot.where(args).near(params[:curloc], params[:radius])
      else
        @lots = Lot.where(args)
      end
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
