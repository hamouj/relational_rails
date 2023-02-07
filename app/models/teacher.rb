class Teacher < ApplicationRecord
  belongs_to :school

  def self.show_bilingual_teachers
    where(bilingual: true)
  end

  def self.filter_by_keyword(keyword)
    where('name = ?', keyword)
  end
end
