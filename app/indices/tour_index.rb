ThinkingSphinx::Index.define :tour, :with => :active_record do
  #fields
  
  indexes summary
  indexes country, direction, cost, sortable: true
  indexes :name, sortable: true

  # attributes
  #has cost

end
