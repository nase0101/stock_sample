class WelcomeController < ApplicationController
  def index
  	@stock = Stock.search_stock(params[:stock])
  	#@stock.name = "no"
    #@stock.ticker = "nono"
    #@stock.last_price = -1
    if @stock
      #render json: @stock
      #render partial: 'lookup'
      
    else
      #render  status: :not_found, nothing: true
      
    end
  end

  def search

  end
end
