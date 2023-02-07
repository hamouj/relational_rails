require 'rails_helper'

describe 'the schools show page', type: :feature do
  before(:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    
    @teacher = @school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher2 = @school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher3 = @school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
  end
  
  it "displays the school with that id including the schools's attributes'" do
    visit "/schools/#{@school.id}"

    expect(page).to have_content(@school.name)
    expect(page).to_not have_content(@school2.name)
    expect(page).to have_content("Year they opened: #{@school.open_year}")
    expect(page).to have_content("Are they fully staffed? #{@school.fully_staffed}")
    expect(page).to have_content("Created at #{@school.created_at}")
    expect(page).to have_content("Updated at #{@school.updated_at}")
  end

  it 'displays a count of the number of teachers associated with this school' do
    visit "/schools/#{@school.id}"

    expect(page).to have_content("Number of teachers: #{@count}")
  end

  it "has a link to '/teachers' page" do
    visit "/schools/#{@school.id}"

    expect(page).to have_link('All Teachers')

    click_on 'All Teachers'
    
    expect(current_path).to eq("/teachers")
  end

  it "has a link to '/students' page" do
    visit "/schools/#{@school.id}"

    expect(page).to have_link('All Schools')
    
    click_on 'All Schools'

    expect(current_path).to eq("/schools")
  end

  it "has a link to that school's teachers page" do
    visit "/schools/#{@school.id}"

    expect(page).to have_link("#{@school.name}")

    click_on "#{@school.name}"

    expect(current_path).to eq("/schools/#{@school.id}/teachers")
  end

  it "has a link to update the school" do
    visit "/schools/#{@school.id}"

    expect(page).to have_link("Update School")

    click_on "Update School"

    expect(current_path).to eq("/schools/#{@school.id}/edit")
  end

  it "has a link to delete the school" do
    visit "/schools/#{@school.id}"

    expect(page).to have_link("Delete School", href: "/schools/#{@school.id}")
  end
end