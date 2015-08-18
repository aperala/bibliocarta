require 'rails_helper'

RSpec.describe Place, type: :model do

  let(:test_place) { create(:place) }

  describe "validations" do
    it "is invalid if the name is not unique" do
      test_place = FactoryGirl.build(:place, name: "Paris")
      expect(test_place).not_to be_valid
    end
  end

end
