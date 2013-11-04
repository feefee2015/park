json.extract! @transaction,  :transactionId, :status, :parker_id, :remarks
json.extract!  @parker,  :plate, :vin, :start, :slotid, :lot_id
json.extract! @lot, :name, :country, :state, :city, :street,  :unitnum, :zip,  :maxtime , :merchant_id
json.extract! @merchant,  :merchantId, :ssn, :taxId

