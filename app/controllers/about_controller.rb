class AboutController < ApplicationController
  def contact
  end
  def my_quotes
    @my_quotes = Quote.all
  end

end
