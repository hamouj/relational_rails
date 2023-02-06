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
end