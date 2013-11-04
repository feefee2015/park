class TransactionsController < ApplicationController
  def create
    begin
      parkerId = params[:parker_id]
      if parkerId.nil?
         #need to establish parker status
        lotId =  params[:lot_id]
        if lotId.nil?
          #need to find lot info
          lots = Lot.where( params.select{|key,value| key.in?(Lot.column_names())})
          if lots.size == 1
            @lot = lots.take
          else
            raise "#{lots.size} parking lots returned- only 1 lot is expected to be retrieved"
          end
        else
          @lot = Lot.find(lotId)
        end
        @parker = @lot.parkers.create!(params.select{|key,value| key.in?(Parker.column_names())})
        parkerId = @parker.id
      end
      @parker = Parker.find(parkerId)
      result = Braintree::Transaction.sale(
          :amount => params[:amount],
          :credit_card => {
              :number => params[:number],
              :cvv => params[:cvv],
              :expiration_month => params[:expire_month],
              :expiration_year => params[:expire_year]
          },
          :options => {
              :submit_for_settlement => true
          }
      )

      if result.success?
        @parker.transactions.create!(:amount => params[:amount],
                                     :status => "success",
                                     :transactionId =>  result.transaction.id)
        render :json => {:status => :ok, :transactionId =>result.transaction.id }.to_json
      else
        @parker.transactions.create!(:amount => params[:amount],
                                     :status => "fail",
                                     :remarks => result.message
        )
        raise result.message
      end
    rescue Exception => e
      render :json => { :message =>e.to_s }.to_json, status: :internal_server_error
    end
  end

  def show
    begin
      @transaction = Transaction.find(params[:id])
      @parker = Parker.find(@transaction.parker_id)
      @lot = Lot.find(@parker.lot_id)
      @merchant = Merchant.find(@lot.merchant_id)
      render template: 'transactions/show',  status: :ok
    rescue Exception => e
      render json: {:message=> e.to_s}.to_json, status: :not_found
    end
  end

  def index
    @transactions = Transaction.where(params.select{|key,value| key.in?(Transaction.column_names())})

    render template: 'transactions/index', status: :ok
  rescue Exception => e
    render :json => {:message =>e.to_s }.to_json, status: :not_found
  end


end
