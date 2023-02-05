require 'rails_helper'

describe 'the teachers index page', type: :feature do
  before(:each) do
    @school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
    @school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)

    @teacher = @school.teachers.create!(name: 'Mrs.Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
    @teacher2 = @school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
  end

  xit "displays each teacher in the system including the teacher's attributes" do
    visit "/teachers"

    expect(page).to have_content(@teacher.name)
    expect(page).to have_content(@teacher2.name)
    expect(page).to have_content("Works at #{@teacher.school.name}")
    expect(page).to have_content("Works at #{@teacher2.school.name}")    
    expect(page).to have_content("Years at #{@teacher.school.name}: #{@teacher.years_at_school}")
    expect(page).to have_content("Years at #{@teacher2.school.name}: #{@teacher2.years_at_school}")
    expect(page).to have_content("Bilingual? #{@teacher.bilingual?}")
    expect(page).to have_content("Bilingual? #{@teacher2.bilingual?}")
    expect(page).to have_content("Created at #{@teacher.created_at}")
    expect(page).to have_content("Created at #{@teacher2.created_at}")
    expect(page).to have_content("Updated at #{@teacher.updated_at}")
    expect(page).to have_content("Updated at #{@teacher2.updated_at}")
  end

  it "has a link to '/teachers' page" do 
    visit "/teachers"

    expect(page).to have_link('All Teachers', href: "/teachers")

    click_on 'All Teachers'
    
    expect(current_path).to eq("/teachers")
  end

  it "has a link to '/students' page" do
    visit "/teachers"

    expect(page).to have_link('All Schools', href: "/schools")

    click_on 'All Schools'

    expect(current_path).to eq("/schools")
  end

  it 'only shows teachers who are bilingual' do
    teacher3 = @school.teachers.create!(name: 'Mrs. Ramirez', years_at_school: 1, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
    
    visit "/teachers"

    expect(page).to have_content(@teacher2.name)
    expect(page).to have_content(teacher3.name)
    expect(page).to_not have_content(@teacher.name)
    expect(page).to have_content("Works at #{@teacher2.school.name}")
    expect(page).to have_content("Works at #{teacher3.school.name}")    
    expect(page).to have_content("Years at #{@teacher2.school.name}: #{@teacher2.years_at_school}")
    expect(page).to have_content("Years at #{teacher3.school.name}: #{teacher3.years_at_school}")
    expect(page).to have_content("Bilingual? #{@teacher2.bilingual?}")
    expect(page).to have_content("Bilingual? #{teacher3.bilingual?}")
    expect(page).to have_content("Created at #{@teacher2.created_at}")
    expect(page).to have_content("Created at #{teacher3.created_at}")
    expect(page).to have_content("Updated at #{@teacher2.updated_at}")
    expect(page).to have_content("Updated at #{teacher3.updated_at}")
  end
end