class ToursController < ApplicationController
  def index
    query = [:query, :name, :direction, :country].select { |key|
      params[key].present?
    }.collect { |key| params[key] }.join(' ') 
    filters = {}
    #if params[:cost_from].present? && params[:cost_to].present?
     # filters[:cost] = params[:cost_from]..params[:cost_to]
    #end

    if params[:cost_from].present?
      filters[:cost] = params[:cost_from]..99999.to_s
    elsif params[:cost_to].present?
      filters[:cost] = 0.to_s..params[:cost_to]
    elsif params[:cost_from].present? && params[:cost_to].present?
      filters[:cost] = params[:cost_from]..params[:cost_to]
    end
    
    if params[:engine] == "elastic"
      @tours = Tour.elastic_search(params)
    elsif params[:engine] == "sphinx"
      @tours = Tour.search query, :with => filters
    else
      @tours = Tour.all
    end
  end

  def show
    @tour = Tour.find(params[:id])
  end
end
