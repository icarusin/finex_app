class BidAndAskResolver

  def findMatches
    @connection = ActiveRecord::Base.connection();
    @results = @connection.execute("select b.id, a.id, b.stock_id, b.created_at, a.created_at from bids b, asks a where b.stock_id = a.stock_id and b.price = a.price
                                   and b.status = 200 and a.status = 200 order by b.created_at, a.created_at ASC")

    @results.each do |row|
      @bidId = row[0]
      @askId = row[1]
      @stockId = row[2]

      ActiveRecord::Base.transaction do
        @bid = Bid.find(@bidId, lock: true)
        @ask = Ask.find(@askId, lock: true)
        @stock = Stock.find(@stockId, lock: true)

        @transactionQuantity = (@bid.quantity <= @ask.quantity) ? @bid.quantity : @ask.quantity
        @bid.quantity = @bid.quantity - @transactionQuantity;
        @ask.quantity = @ask.quantity - @transactionQuantity;
        if(@bid.quantity == 0)
        @bid.status = 210
        end
        if(@ask.quantity == 0)
        @ask.status = 210
        end

        @stock.price = @bid.price;

        @stock.save
        @bid.save
        @ask.save

        if(@transactionQuantity > 0)
          @stockPrice = StockPrice.new
          @stockPrice.ask_id = @askId
          @stockPrice.bid_id =  @bidId
          @stockPrice.price = @bid.price
          @stockPrice.price_unit = 300
          @stockPrice.transaction_time = Time.now
        @stockPrice.quantity = @transactionQuantity
        @stockPrice.stock = @stock
        @stockPrice.save
          Rails.logger.info "Saved matching bid/ask for" + @stock.name
        else
          Rails.logger.info "No matchings bid/ask for" + @stock.name  
        end
        
        Rails.logger.info "Task Run successfully"
      end
    end
  end
  
  def logStocks
    @stocks = Stock.all
    
    @stocks.each do |st|
      Rails.logger.info st.name + " is found"
    end
    
  end
  
end