class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @search ||= Search.new(:term => 'social')
  end
end
