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
    end
  end
  def create
    begin

      @lot = Lot.create!(params.select{|key,value| key.in?(Lot.column_names())})
      render template: 'lots/show', status: :created
    rescue Exception => e
      Rails.logger.error("Encountered an error while creating a lot  #{e}")
    end
  end
  def show
    @lot = Lot.find(params[:id])
    render template: 'lots/show',  status: :ok
  end

end
