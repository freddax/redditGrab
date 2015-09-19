class QuotesController < ApplicationController
  def index
    #we want to show all the quotes from reddit
    @quotes = quotes
  end

  def show
    @quote = quotes.sample
  end

  def create
    #save the quote in our table and redirect to show action
    quotes = params[:quotes]
    Quote.create(quote: quotes)
    redirect_to quotes_show_path
  end

  private

#this is returning a hash, so we can add those keys in the end
  def quotes
    parse_response(HTTParty.get(reddit_endpoint))["data"]["children"].select {|x| x["data"]["selftext"] != ""}
  end

  def reddit_endpoint
    "http://www.reddit.com/r/quotes.json?limit=100"
  end

  def parse_response(response)
    JSON.parse(response.body)
  end
end
