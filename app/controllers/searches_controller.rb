class SearchesController < ApplicationController
  def term

    current_user.update_last_search_term params[:term]

    client = TwitterClient.new(current_user.token, current_user.secret)

    results = client.search_tweets params[:term]

    render :json => results

  end

  def user
    client = TwitterClient.new(current_user.token, current_user.secret)

    results = client.search_user params[:username]

    render :json => results
  end

end
