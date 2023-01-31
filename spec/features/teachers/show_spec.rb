require 'rails_helper'

describe 'the teachers show page' do
  it 'displays a teacher name' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now())
    teacher2 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/teachers/#{teacher.id}"

    expect(page).to have_content(teacher.name)
    expect(page).to_not have_content(teacher2.name)
  end

  it 'displays the number of years the teacher has been at the school' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now())
    teacher2 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/teachers/#{teacher.id}"

    expect(page).to have_content(teacher.years_at_school)
  end

  it 'displays whether the teacher is bilingual' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now())
    teacher2 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/teachers/#{teacher.id}"

    expect(page).to have_content(teacher.bilingual?)
  end

  it 'displays when the entry was created' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now())
    teacher2 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/teachers/#{teacher.id}"

    expect(page).to have_content(teacher.created_at)
  end
  
  it 'displays when the entry was updated' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now())
    teacher2 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/teachers/#{teacher.id}"

    expect(page).to have_content(teacher.updated_at)
  end
end