require 'rails_helper'

describe 'the school index page' do
  it 'displays a list of schools' do
    school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
    school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now())
   
    visit "/schools"

    expect(page).to have_content(school.name)
    expect(page).to have_content(school2.name)
  end
end