class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_twitter_client

  def show
    @username = params[:username]

    response = @client.search_user @username

    @results = response[:tweets]
    @time = Time.parse(response[:searchTime]).utc
  end
end
