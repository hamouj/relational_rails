require 'rails_helper'

describe 'the school index page', type: :feature do
  before (:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.new(2001, 2, 3, 4, 5, 6), updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2010, 1, 4, 7, 8, 3), updated_at: DateTime.now)
  end

  it 'displays a list of schools' do
    visit "/schools"

    expect(page).to have_content(@school.name)
    expect(page).to have_content(@school2.name)
  end

  it 'displays a list of schools with created_at date, ordered by created_at date' do
    visit "/schools"

    expect(page).to have_content("Created at: #{@school.created_at}")
    expect(page).to have_content("Created at: #{@school2.created_at}")
    expect(@school2.name).to appear_before(@school.name)
  end

  it "has a link to '/teachers' page" do 
    visit "/schools"

    expect(page).to have_link('All Teachers')

    click_on 'All Teachers'
    
    expect(current_path).to eq("/teachers")
  end

  it "has a link to '/students' page" do
    visit "/schools"

    expect(page).to have_link('All Schools')
    
    click_on 'All Schools'

    expect(current_path).to eq("/schools")
  end

  it 'has a link to create a new School record' do
    visit '/schools'

    expect(page).to have_link("New School")

    click_on "New School"

    expect(current_path).to eq("/schools/new")
  end

  it 'has a link to edit each school' do
    visit '/schools'

    expect(page).to have_link "Update #{@school.name}"
    expect(page).to have_link "Update #{@school2.name}"
  end

  it 'has a link to delete each school' do
    visit '/schools'

    expect(page).to have_link "Delete #{@school.name}"
    expect(page).to have_link "Delete #{@school2.name}"
  end

  it 'has a form to search by name (exact match)' do
    visit '/schools'

    fill_in('keyword', with: 'Frias')
    click_on "Search"

    expect(page).to have_content(@school.name)
    expect(page).to_not have_content(@school2.name)
  end

  it 'has a form to search by name (partial match)' do
    visit '/schools'

    fill_in('keyword', with: 'ia')
    click_on "Search"

    expect(page).to have_content(@school.name)
    expect(page).to_not have_content(@school2.name)
  end
end