require 'rails_helper'

describe School, type: :model do
  describe '#list_teachers_by_school_id' do
    it 'lists all teachers from a specific school' do
      school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
      school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

      teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)

      expect(school.list_teachers_by_school_id).to eq([teacher, teacher2])
    end
  end

  describe '::order_schools' do
    it 'orders schools by created_at data' do
      school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.new(2001, 2, 3, 4, 5, 6), updated_at: DateTime.now)
      school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2010, 1, 4, 7, 8, 3), updated_at: DateTime.now)
      school3 = School.create!(name: 'Detwiler', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2022, 2, 7, 3, 4, 3), updated_at: DateTime.now)

      expect(School.order_schools).to eq([school3, school2, school])
    end
  end
end
