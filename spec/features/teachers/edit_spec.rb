require 'rails_helper'

describe 'teachers edit page', type: :feature do
  before(:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

    @teacher = @school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher2 = @school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
  end

  it 'links to the edit page from the teacher show page' do
    visit "/teachers/#{@teacher.id}"

    click_link 'Update Teacher'

    expect(current_path).to eq("/teachers/#{@teacher.id}/edit")
  end

  it 'links to the edit page from the teacher index page' do
    visit "/teachers"

    click_link "Update #{@teacher2.name}"

    expect(current_path).to eq("/teachers/#{@teacher2.id}/edit")
  end

  it 'can edit the teacher' do
    visit "/teachers/#{@teacher.id}"

    expect(page).to have_content("Mrs.Vicario")
    expect(page).to have_content("Bilingual? false")
    click_link "Update Teacher"

    choose 'bilingual_true'
    click_button 'Update'

    expect(current_path).to eq("/teachers/#{@teacher.id}")
    expect(page).to have_content("Mrs.Vicario")
    expect(page).to have_content("Bilingual? true")
    expect(page).to have_content("Years at #{@school.name}: 7")
    expect(page).to have_content("Works at #{@school.name}")
  end
end