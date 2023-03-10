require 'rails_helper'

describe 'destroying a school', type: :feature do
  before(:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    
    @teacher = @school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher2 = @school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher3 = @school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
  end

  it "has a link to delete the school on the show page" do
    visit "/schools/#{@school.id}"

    expect(page).to have_link("Delete School")

    click_link "Delete School"

    expect(current_path).to eq("/schools")
  end

  it "has a link to delete the school on the index page which destroys the school record and associated teachers, then redirects to the school index page" do
    visit "/schools"

    expect(page).to have_link("Delete #{@school.name}")

    click_link "Delete #{@school.name}"

    expect(current_path).to eq("/schools")
    expect(page).to_not have_content("#{@school.name}")

    click_link "All Teachers"

    expect(page).to_not have_content("#{@teacher.name}")
    expect(page).to_not have_content("#{@teacher2.name}")
  end

  it "destroys the school record and associated teachers, then redirects to the school index page" do
    visit "/schools/#{@school.id}"

    click_link "Delete School"

    expect(page).to_not have_content("#{@school.name}")

    click_link "All Teachers"

    expect(page).to_not have_content("#{@teacher.name}")
    expect(page).to_not have_content("#{@teacher2.name}")
  end
end