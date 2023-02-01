class School < ApplicationRecord
  has_many :teachers

  def list_teachers_by_school_id
    Teacher.where(school_id: id)
  end

  def self.order_schools
    School.all.order(created_at: :desc)
  end

  def teacher_count
    list_teachers_by_school_id.count
  end
end