# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@school = School.create!(name: 'Frias', open_year: 2003, fully_staffed: false, created_at: DateTime.new(2004, 2, 3, 4, 5, 6), updated_at: DateTime.now)
@school2 = School.create!(name: 'Robison', open_year: 1973, fully_staffed: false, created_at: DateTime.new(2010, 1, 4, 7, 8, 3), updated_at: DateTime.now)
@school3 = School.create!(name: 'Detwiler', open_year: 2001, fully_staffed: false, created_at: DateTime.now, updated_at: DateTime.now)
@school4 = School.create!(name: 'Ortwein', open_year: 2019, fully_staffed: true, created_at: DateTime.now, updated_at: DateTime.now)

@teacher = @school.teachers.create!(name: 'Mrs. Vicario', years_at_school: 7, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
@teacher2 = @school.teachers.create!(name: 'Mrs. Auch', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
@teacher3 = @school2.teachers.create!(name: 'Mrs. Hall', years_at_school: 15, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
@teacher4 = @school4.teachers.create!(name: 'Mrs. Scrofani', years_at_school: 4, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
@teacher5 = @school3.teachers.create!(name: 'Mrs. Ramirez', years_at_school: 1, bilingual: true, created_at: DateTime.now, updated_at: DateTime.now)
@teacher6 = @school2.teachers.create!(name: 'Mrs. Chrisler', years_at_school: 10, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
@teacher7 = @school.teachers.create!(name: 'Mrs. Rash', years_at_school: 8, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
@teacher8 = @school.teachers.create!(name: 'Mrs. Yachbes', years_at_school: 5, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
@teacher9 = @school3.teachers.create!(name: 'Mrs. Stepke', years_at_school: 13, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
@teacher10 = @school4.teachers.create!(name: 'Mrs. Kay', years_at_school: 3, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
@teacher11 = @school.teachers.create!(name: 'Mr. Marchant', years_at_school: 9, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)
@teacher12 = @school2.teachers.create!(name: 'Mr. Liles', years_at_school: 4, bilingual: false, created_at: DateTime.now, updated_at: DateTime.now)