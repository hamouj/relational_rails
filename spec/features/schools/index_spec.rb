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
  end

  it "has a link to '/teachers' page" do 
    visit "/schools/"

    expect(page).to have_link('All Teachers', href: "/teachers")
  end
end