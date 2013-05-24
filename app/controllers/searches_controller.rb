class SearchesController < ApplicationController
  def create
    client = TwitterClient.new(current_user.token, current_user.secret)

    results = client.search_tweets params[:search][:term]
    binding.pry
    head :ok
  end

end
