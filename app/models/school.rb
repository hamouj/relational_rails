class School < ApplicationRecord
  has_many :teachers

  def list_teachers_by_school_id
    @teachers = Teacher.where(school_id: id)
  end
end