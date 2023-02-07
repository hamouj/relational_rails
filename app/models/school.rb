class School < ApplicationRecord
  has_many :teachers, :dependent => :destroy

  def self.order_schools
    order(created_at: :desc)
  end

  def teacher_count
    self.teachers.count
  end

  def sort_teachers_alphabetically
    self.teachers.order(:name)
  end

  def filter_by_years_at_school(number)
    self.teachers.where('years_at_school > ?', number)
  end

  def self.filter_by_keyword(keyword)
    where("name LIKE ?", "%#{keyword}%")
  end
end