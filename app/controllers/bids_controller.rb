class BidsController < ApplicationController
  
  def show
    @bid = Bid.find(params[:id])
  end
  
 def new
    @bid = Bid.new
  end
  
  def create
    @bid = Bid.new(params[:bid])
    @bid.status = 200
    @bid.price_unit = 300;
    if @bid.save
      BidAndAskResolver.new(@bid.price).findMatches
      flash[:success] = "Bid created successfully!"
      redirect_to @bid
    else
      render 'new'
    end
  end
end
