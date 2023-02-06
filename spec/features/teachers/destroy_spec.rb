require 'rails_helper'

describe 'destroying a teacher', type: :feature do
  before(:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    
    @teacher = @school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher2 = @school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher3 = @school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
  end

  it 'has a link to delete the teacher on the teacher show page then redirects to the teacher index page' do
    visit "/teachers/#{@teacher.id}"

    expect(page).to have_link ("Delete Teacher")
    
    click_link "Delete Teacher"

    expect(current_path).to eq("/teachers")
    expect(page).to_not have_content("#{@teacher.name}")
  end
end