class Tour < ActiveRecord::Base
  attr_accessible :cost, :country, :direction, :name, :summary

  include Tire::Model::Search
  include Tire::Model::Callbacks
end
