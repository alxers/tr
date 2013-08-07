class Tour < ActiveRecord::Base
  attr_accessible :cost, :country, :direction, :name, :summary
end
