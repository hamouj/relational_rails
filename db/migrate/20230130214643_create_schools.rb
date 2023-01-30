class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :open_year
      t.fully_staffed :boolean
      t.timestamps
    end
  end
end
