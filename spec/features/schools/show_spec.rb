require 'rails_helper'

describe 'the schools show page', type: :feature do
  it "displays the school with that id including the schools's attributes'" do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
   
    visit "/schools/#{school.id}"

    expect(page).to have_content(school.name)
    expect(page).to_not have_content(school2.name)
    expect(page).to have_content("Year they opened: #{school.open_year}")
    expect(page).to have_content("Are they fully staffed? #{school.fully_staffed}")
    expect(page).to have_content("Created at #{school.created_at}")
    expect(page).to have_content("Updated at #{school.updated_at}")
  end

  it 'displays a count of the number of teachers associated with this school' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    
    teacher = school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    teacher2 = school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    teacher3 = school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
    
    visit "/schools/#{school.id}"

    expect(page).to have_content("Number of teachers: #{@count}")
  end
end