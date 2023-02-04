require 'rails_helper'

describe "school teachers new page", type: :feature do
  before (:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

    @teacher = @school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher2 = @school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher3 = @school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
  end

  it 'links to the new page from the school teachers index page' do
    visit "/schools/#{@school.id}/teachers"
    click_link "Create Teacher"

    expect(current_path).to eq("/schools/#{@school.id}/teachers/new")
  end

  it 'can create a new teacher with teacher attributes' do
    visit "/schools/#{@school.id}/teachers/new"

    fill_in('name', with: "Mrs. Hamou")
    fill_in('years_at_school', with: 3)
    choose 'bilingual_false'
    click_button "Create Teacher"

    expect(current_path).to eq("/schools/#{@school.id}/teachers")
    expect(page).to have_content("Mrs. Hamou")
    expect(page).to have_content("Years at #{@school.name}: 3")
    expect(page).to have_content("Bilingual? false")
  end
end