require './lib/modules/filterable'

class Teacher < ApplicationRecord
  belongs_to :school
  extend Filterable

  def self.show_bilingual_teachers
    where(bilingual: true)
  end
end
