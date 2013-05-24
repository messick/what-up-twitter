class Search < ActiveRecord::Base
  attr_accessible :last_cached_at, :term
end
