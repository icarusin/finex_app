class AsksController < ApplicationController
  
  def show
    @ask = Ask.find(params[:id])
  end
  
 def new
    @ask = Ask.new
  end
  
  def create
    @ask = Ask.new(params[:ask])
    @ask.status = 200
    @ask.price_unit = 300;
    if @ask.save
      # Handle a successful save.
      flash[:success] = "Ask created successfully!"
      redirect_to @ask
    else
      render 'new'
    end
  end
end
