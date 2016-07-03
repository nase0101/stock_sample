class WelcomeController < ApplicationController
  def index
  	@stock = Stock.show_stock
  end
end
