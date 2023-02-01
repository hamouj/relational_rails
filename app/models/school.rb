class School < ApplicationRecord
  has_many :teachers

  def show_teachers
    @teachers = Teacher.where(school_id: id)
  end
end