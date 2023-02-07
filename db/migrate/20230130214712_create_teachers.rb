class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :years_at_school
      t.boolean :bilingual
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
