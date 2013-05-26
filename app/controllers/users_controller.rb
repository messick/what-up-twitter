class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    client = TwitterClient.new(current_user.token, current_user.secret)

    @username = params[:username]
    @results = client.search_user @username
  end
end
