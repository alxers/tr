class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.text :summary
      t.integer :cost
      t.string :direction
      t.string :country

      t.timestamps
    end
  end
end
