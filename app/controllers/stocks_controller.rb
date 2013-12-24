class StocksController < ApplicationController
  def show
    @stock = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new
  end

  def index
    @stocks = Stock.all
  end

  def prices
    @stock = Stock.find(params[:id])
    @stock_prices = @stock.stock_prices
  end

  def buys
    @stock = Stock.find(params[:id])
    @bids = @stock.bids
  end

  def sells
    @stock = Stock.find(params[:id])
    @asks = @stock.asks
  end

  def currentPrice
    @stock = Stock.find(params[:id])
  end

  def create
    @stock = Stock.new(params[:stock])
    if @stock.save
      # Handle a successful save.
      flash[:success] = "Stock created successfully!"
      redirect_to @stock
    else
      render 'new'
    end
  end
end
