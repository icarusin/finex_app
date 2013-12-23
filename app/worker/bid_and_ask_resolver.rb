class BidAndAskResolver
  def initialize(price)
    @price = price
  end

  def findMatches
    return false unless (@price)
    @connection = ActiveRecord::Base.connection();
    @results = @connection.execute("select b.id, a.id, b.stock_id, b.created_at, a.created_at from bids b, asks a where b.stock_id = a.stock_id and b.price = a.price
                                   and b.status = 200 and a.status = 200 order by b.created_at, a.created_at ASC")

    @results.each do |row|
      @bidId = row[0]
      @askId = row[1]
      @stockId = row[2]

      @stock = Stock.find(@stockId)

      ActiveRecord::Base.transaction do
        @bid = Bid.find(@bidId, lock: true)
        @ask = Ask.find(@askId, lock: true)
        
        @transactionQuantity = (@bid.quantity <= @ask.quantity) ? @bid.quantity : @ask.quantity
        @bid.quantity = @bid.quantity - @transactionQuantity;
        @ask.quantity = @ask.quantity - @transactionQuantity;
        if(@bid.quantity == 0)
          @bid.status = 210
        end
        if(@ask.quantity == 0)
          @ask.status = 210
        end
        @bid.save
        @ask.save
        @stockPrice = StockPrice.new
        @stockPrice.ask_id = @askId
        @stockPrice.bid_id =  @bidId
        @stockPrice.price = @bid.price
        @stockPrice.price_unit = 300
        @stockPrice.transaction_time = Time.now
        @stockPrice.quantity = @transactionQuantity
        @stockPrice.stock = @stock
        @stockPrice.save
        Rails.logger.info @stock.name
      end
    end
  end
end