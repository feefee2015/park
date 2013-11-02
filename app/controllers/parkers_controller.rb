class ParkersController < ApplicationController
  def create
    @lot = Lot.find(params[:lot_id])
    @parker = @lot.parkers.create!(params.select{|key,value| key.in?(Parker.column_names())})
    render template: 'lots/show', status: :created
  end

  def index
    #@lot = Lot.find(params[:lot_id])
    #@parkers = @lot.parkers.where(params.select{|key,value| key.in?(Parker.column_names())})
    render template: 'parkers/index', status: :ok
  end

  def show

    @parker = Parker.find(params[:id])
    render template: 'parkers/show', status: :ok
  end
  def pay
    puts 'pay!!'
    result = Braintree::Transaction.sale(
        :amount => "1000.00",
        :credit_card => {
            :number => params[:number],
            :cvv => params[:cvv],
            :expiration_month => params[:month],
            :expiration_year => params[:year]
        },
        :options => {
            :submit_for_settlement => true
        }
    )

    if result.success?
      render :json => {:status => :ok, :transactionId =>result.transaction.id }.to_json
    else
      render :json => {:status => "failed", :message =>result.message }.to_json
    end
  end
end
