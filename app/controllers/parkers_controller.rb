class ParkersController < ApplicationController
  def create
    begin
      @lot = Lot.find(params[:lot_id])
      @parker = @lot.parkers.create!(params.select{|key,value| key.in?(Parker.column_names())})
      render template: 'lots/show', status: :created
    rescue Exception => e
      render json: {:message=> e.to_s}.to_json, status: :internal_server_error
    end

  end

  def index
    begin
      @lot = Lot.find(params[:lot_id])
      @parkers = @lot.parkers.where(params.select{|key,value| key.in?(Parker.column_names())})
      render template: 'parkers/index', status: :ok
    rescue Exception => e
      render json: {:message=> e.to_s}.to_json, status: :not_found
    end
  end

  def show
    begin
      @parker = Parker.find(params[:id])
      render template: 'parkers/show', status: :ok
    rescue Exception => e
      render json: {:message=> e.to_s}.to_json, status: :not_found
    end
  end

end
