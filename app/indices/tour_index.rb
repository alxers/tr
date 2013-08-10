ThinkingSphinx::Index.define :tour, :with => :active_record do
  #fields
  
  indexes direction, country, cost, summary
  indexes :name

end
