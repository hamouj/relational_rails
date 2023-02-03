require 'rails_helper'

describe 'schools new page' do
  before(:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.new(2001, 2, 3, 4, 5, 6), updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2010, 1, 4, 7, 8, 3), updated_at: DateTime.now)
  end

  it 'links to the new page from the schools index' do
    visit "/schools"

    click_link('New School')
    expect(current_path).to eq('/schools/new')
  end

  it 'can create a new school with school attributes' do
    visit "/schools/new"

    fill_in('name', with: 'Detwiler')
    fill_in('open_year', with: 1956)
    choose 'fully_staffed_false'
    click_button('Create School')

    new_school_id = School.last.id
    expect(current_path).to eq("/schools/#{new_school_id}")
    expect(page).to have_content("Detwiler")  
    expect(page).to have_content("Year they opened: 1956")
    expect(page).to have_content("Are they fully staffed? false")
  end
end