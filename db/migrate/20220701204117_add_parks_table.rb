class AddParksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :longitude
      t.integer :latitude
      t.string :statecode
      t.string :animal
      t.string :type
      t.string :description
    end
  end
end
