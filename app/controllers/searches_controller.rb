class SearchesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_twitter_client

  def term
    current_user.update_last_search_term params[:term]

    results = @client.search_term params[:term]

    render :json => results

  end

  def user
    results = @client.search_user params[:username]

    render :json => results
  end

end
