require 'rails_helper'

describe School, type: :model do
  describe '#show_teachers' do
    it 'lists all teachers from a specific school' do
      school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
      school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

      teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      
      expect(school.show_teachers).to eq([teacher, teacher2])
    end

    it 'only lists teachers for a specific school' do
      school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
      school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

      teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher3 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)

      expect(school.show_teachers).to eq([teacher, teacher2])
    end
  end
end
