require 'rails_helper'

describe 'school teachers index', type: :feature do
  before (:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

    @teacher = @school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher2 = @school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher3 = @school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
  end

  it 'displays the names and attributes of the teachers who work at that school' do
    visit "/schools/#{@school.id}/teachers"

    expect(page).to have_content(@teacher.name)
    expect(page).to have_content(@teacher2.name)
    expect(page).to_not have_content(@teacher3.name)
    expect(page).to have_content(@teacher.years_at_school)
    expect(page).to have_content(@teacher2.years_at_school)
    expect(page).to have_content("Bilingual? #{@teacher.bilingual?}")
    expect(page).to have_content("Bilingual? #{@teacher2.bilingual?}")
    expect(page).to have_content("Created at #{@teacher.created_at}")
    expect(page).to have_content("Created at #{@teacher2.created_at}")
    expect(page).to have_content("Updated at #{@teacher.updated_at}")
    expect(page).to have_content("Updated at #{@teacher2.updated_at}")
  end

  it "has a link to '/teachers' page" do
    visit "/schools/#{@school.id}/teachers"

    expect(page).to have_link('All Teachers')
    
    click_on 'All Teachers'
    
    expect(current_path).to eq("/teachers")
  end

  it "has a link to '/students' page" do
    visit "/schools/#{@school.id}/teachers"

    expect(page).to have_link('All Schools')

    click_on 'All Schools'

    expect(current_path).to eq("/schools")
  end

  it 'has a link to alphabetize teachers by name' do
    visit "/schools/#{@school.id}/teachers"

    expect(page).to have_link('Sort Teachers Alphabetically', href: "/schools/#{@school.id}/teachers?sort=alpha")
    click_on 'Sort Teachers Alphabetically'

    expect(@teacher2.name).to appear_before(@teacher.name)
    expect(current_path).to eq("/schools/#{@school.id}/teachers")
  end
end