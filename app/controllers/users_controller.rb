class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_twitter_client

  def show
    @username = params[:username]
    @results = @client.search_user @username
  end
end
