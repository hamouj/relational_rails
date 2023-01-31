require 'rails_helper'

describe 'the schools show page' do
  it 'displays a school name' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/schools/#{school.id}"

    expect(page).to have_content(school.name)
    expect(page).to_not have_content(school2.name)
  end

  it 'displays the year a school opened' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/schools/#{school.id}"

    expect(page).to have_content(school.open_year)
  end

  it 'displays whether the school is fully staffed' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/schools/#{school.id}"

    expect(page).to have_content(school.fully_staffed)
  end

  it 'displays when the entry was created' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/schools/#{school.id}"

    expect(page).to have_content(school.created_at)
  end

  it 'displays when the entry was updated' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/schools/#{school.id}"

    expect(page).to have_content(school.updated_at)
  end
end