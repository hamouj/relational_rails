require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'association' do
    it {should belong_to :school}
  end

  describe '::show_bilingual_teachers' do
    it 'lists teachers who are bilingual' do
      school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
      school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
  
      teacher = school.teachers.create!(name: 'Mrs. Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher3 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
      teacher4 = school.teachers.create!(name: 'Mrs. Ramirez', years_at_school: 1, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)

      expect(Teacher.show_bilingual_teachers).to eq([teacher3, teacher4])
    end
  end

  describe '::filter.by.keyword()' do
    it 'returns a specific teacher if the keyword is an exact or partial match to a teacher name' do
      school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
      school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

      teacher = school.teachers.create!(name: 'Mrs. Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
      teacher3 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
      teacher4 = school.teachers.create!(name: 'Mrs. Ramirez', years_at_school: 1, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)

      expect(Teacher.filter_by_keyword('Mrs.')).to eq([teacher, teacher2, teacher3, teacher4])
      expect(Teacher.filter_by_keyword('Mrs.auch')).to eq([])
      expect(Teacher.filter_by_keyword('Mrs. V')).to eq([teacher])
    end
  end
end
