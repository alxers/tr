class Tour < ActiveRecord::Base
  attr_accessible :cost, :country, :direction, :name, :summary

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.elastic_search(params)
    tire.search do
      query { string params[:query] } if params[:query].present?
      query { string params[:name] } if params[:name].present?
      query { string params[:direction] } if params[:direction].present?
      query { string params[:country] } if params[:country].present?
      #filter :range, cost: { from: params[:cost_from], to: params[:cost_to] }
      filter :range, cost: { from: params[:cost_from] } if params[:cost_from].present?
      filter :range, cost: { to: params[:cost_to] } if params[:cost_to].present?
    end
  end

end
