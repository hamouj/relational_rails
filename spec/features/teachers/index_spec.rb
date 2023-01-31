require 'rails_helper'

describe 'the teachers index page' do
  it 'displays a list of teacher names' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = Teacher.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school.id)
    teacher2 = Teacher.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school2.id)
   
    visit "/teachers"

    expect(page).to have_content(teacher.name)
    expect(page).to have_content(teacher2.name)
  end

  it 'displays the number of years a teacher has worked at the school for each teacher' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = Teacher.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school.id)
    teacher2 = Teacher.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school2.id)
  
    visit "/teachers"

    expect(page).to have_content(teacher.years_at_school)
    expect(page).to have_content(teacher2.years_at_school)
  end

  it 'displays whether the teacher is bilingual for each teacher' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = Teacher.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school.id)
    teacher2 = Teacher.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school2.id)
  
    visit "/teachers"

    expect(page).to have_content(teacher.bilingual?)
    expect(page).to have_content(teacher2.bilingual?)
  end

  it 'displays when the entry was created for each teacher' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = Teacher.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school.id)
    teacher2 = Teacher.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school2.id)
   
    visit "/teachers"

    expect(page).to have_content(teacher.created_at)
    expect(page).to have_content(teacher2.created_at)
  end

  it 'displays when the entry was updated for each teacher' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())

    teacher = Teacher.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school.id)
    teacher2 = Teacher.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now(), school_id: school2.id)
   
    visit "/teachers"

    expect(page).to have_content(teacher.updated_at)
    expect(page).to have_content(teacher2.updated_at)
  end
end