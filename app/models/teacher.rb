class Teacher < ApplicationRecord
  belongs_to :school

  def self.show_bilingual_teachers
    where(bilingual: true)
  end
end
