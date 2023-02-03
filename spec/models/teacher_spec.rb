require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'association' do
    it {should belong_to :school}
  end
end
