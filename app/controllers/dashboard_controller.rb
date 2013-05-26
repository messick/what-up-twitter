class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_twitter_client

  def index
    @term = current_user.last_search_term.nil? ? 'social' : current_user.last_search_term
    @results = @client.search_term @term
  end
end
