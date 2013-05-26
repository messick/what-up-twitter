class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @term = current_user.last_search_term.nil? ? 'social' : current_user.last_search_term
  end
end
