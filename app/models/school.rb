class School < ApplicationRecord
  has_many :teachers

  def self.order_schools
    order(created_at: :desc)
  end

  def teacher_count
    self.teachers.count
  end
end