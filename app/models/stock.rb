class Stock < ActiveRecord::Base

  def self.show_stock
  	looked_up_stock      = StockQuote::Stock.quote('GOOG')
  	new_stock            = Stock.new
  	new_stock.ticker     = "#{looked_up_stock.symbol}"
  	new_stock.name       = "#{looked_up_stock.name}"
  	new_stock.last_price = new_stock.price

  	return new_stock
  end

  def self.search_stock(ticker)
  	if !(ticker=="")
  		looked_up_stock      = StockQuote::Stock.quote(ticker)
  		#return nil unless looked_up_stock.name

  		new_stock            = Stock.new
  		new_stock.ticker     = "#{looked_up_stock.symbol}"
  		new_stock.name       = "#{looked_up_stock.name}"
  		new_stock.last_price = new_stock.price
    else
    	new_stock            = Stock.new
  		new_stock.ticker     = "N/A"
  		new_stock.name       = "N/A"
  		new_stock.last_price = -1

    end


  	return new_stock
  end

  def price
  	closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} (Closing)" if closing_price
    
    opening_price = StockQuote::Stock.quote(ticker).open
    return "#{opening_price} (Opening)" if opening_price

    return 'Unavailable'
  end
end
