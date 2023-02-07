require 'rails_helper'

describe School, type: :model do
  let!(:school) {School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.new(2001, 2, 3, 4, 5, 6), updated_at: DateTime.now)}
  let!(:school2) {School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2010, 1, 4, 7, 8, 3), updated_at: DateTime.now)}
  let!(:school3) {School.create!(name: 'Detwiler', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2022, 2, 7, 3, 4, 3), updated_at: DateTime.now)}

  let!(:teacher) {school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)}
  let!(:teacher2) {school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)}
  let!(:teacher3) {school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)}
  let!(:teacher4) {school2.teachers.create!(name: 'Mrs. Ramirez', years_at_school: 1, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)}
  describe 'association' do
    it {should have_many :teachers}
  end

  describe '::order_schools' do
    it 'orders schools by created_at data' do
      expect(School.order_schools).to eq([school3, school2, school])
    end
  end

  describe '#teacher_count' do
    it 'counts the number of teachers at a specific school' do
      expect(school.teacher_count).to eq(2)
      expect(school2.teacher_count).to eq(2)
    end
  end

  describe '#sort_teachers_alphabetically' do
    it 'sorts teachers in alphabetical order' do
      expect(school.sort_teachers_alphabetically).to eq([teacher2, teacher])
      expect(school2.sort_teachers_alphabetically).to eq([teacher3, teacher4])
    end
  end

  describe '#filter_by_years_at_school()' do
    it 'returns teachers based on the number of years they worked at the school' do
      expect(school.filter_by_years_at_school(8)).to eq([teacher2])
    end
  end

  describe '::filter_by_keyword_exact()' do
    it 'returns a specific school if the keyword is an exact match to a school name' do
      expect(School.filter_by_keyword_exact('Frias')).to eq([school])
      expect(School.filter_by_keyword_exact('frias')).to eq([])
    end
  end

  describe '::filter_by_keyword_partial()' do
    it 'returns specific school(s) if they keyword is a partial match to a school name ' do
      school4 = School.create!(name: 'Friar', open_year: 2020, fully_staffed: true, created_at: DateTime.now, updated_at: DateTime.now)

      expect(School.filter_by_keyword_partial('Fr')).to eq([school, school4])
    end
  end

  describe '::list_names' do
    it 'returns a list of school names' do
      expect(School.list_names).to eq(["Frias", "Robison", "Detwiler"])
    end
  end
end
