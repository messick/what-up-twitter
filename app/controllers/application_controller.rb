class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_twitter_client
    @client = TwitterClient.new(current_user.token, current_user.secret)
  end
end
