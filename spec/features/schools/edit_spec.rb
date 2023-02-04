require 'rails_helper'

describe "the schools edit page", type: :feature do
  before(:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.new(2001, 2, 3, 4, 5, 6), updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2010, 1, 4, 7, 8, 3), updated_at: DateTime.now)
  end
  
  it 'can edit the school' do
    visit "/schools/#{@school.id}"
 
    expect(page).to have_content("Year they opened: 2003")
    click_link "Update School"
    
    fill_in('open_year', with: 2013)
    click_button 'Update'

    expect(current_path).to eq("/schools/#{@school.id}")
    expect(page).to have_content("Year they opened: 2013")
    expect(page).to have_content("Frias")
    expect(page).to have_content("Are they fully staffed? false")
  end
end