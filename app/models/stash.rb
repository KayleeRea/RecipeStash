class Stash < ActiveRecord::Base
  belongs_to :user
  serialize :ingredients, JSON
end