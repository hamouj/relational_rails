require 'rails_helper'

describe 'show_teachers page' do
  it 'displays the names of the teachers who work at that school' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

    teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    teacher3 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)

    visit "/schools/#{school.id}/teachers"

    expect(page).to have_content(teacher.name)
    expect(page).to have_content(teacher2.name)
    expect(page).to_not have_content(teacher3.name)
  end

  it 'displays the information of each teach who works at that school' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

    teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)

    visit "/schools/#{school.id}/teachers"

    expect(page).to have_content(teacher.years_at_school)
    expect(page).to have_content(teacher2.years_at_school)
    expect(page).to have_content("Bilingual? #{teacher.bilingual?}")
    expect(page).to have_content("Bilingual? #{teacher2.bilingual?}")
    expect(page).to have_content("Created at #{teacher.created_at}")
    expect(page).to have_content("Created at #{teacher2.created_at}")
    expect(page).to have_content("Updated at #{teacher.updated_at}")
    expect(page).to have_content("Updated at #{teacher2.updated_at}")
  end
end