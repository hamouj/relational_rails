require 'rails_helper'

describe School, type: :model do
  describe 'association' do
    it {should have_many :teachers}
  end

  describe '::order_schools' do
    it 'orders schools by created_at data' do
      school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.new(2001, 2, 3, 4, 5, 6), updated_at: DateTime.now)
      school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2010, 1, 4, 7, 8, 3), updated_at: DateTime.now)
      school3 = School.create!(name: 'Detwiler', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2022, 2, 7, 3, 4, 3), updated_at: DateTime.now)

      expect(School.order_schools).to eq([school3, school2, school])
    end
  end

  describe '#teacher_count' do
    it 'counts the number of teachers at a specific school' do
      school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
      school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

      teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher3 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)

      expect(school.teacher_count).to eq(2)
      expect(school2.teacher_count).to eq(1)
    end
  end

  describe '#sort_teachers_alphabetically' do
    it 'sorts teachers in alphabetical order' do
      school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
      school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

      teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher3 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
      teacher4 = school2.teachers.create!(name: 'Mrs. Ramirez', years_at_school: 1, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)

      expect(school.sort_teachers_alphabetically).to eq([teacher2, teacher])
      expect(school2.sort_teachers_alphabetically).to eq([teacher3, teacher4])
    end
  end
end
