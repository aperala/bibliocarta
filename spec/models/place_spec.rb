require 'rails_helper'

RSpec.describe Place, type: :model do

  let(:test_place) { create(:place) }
  let(:test_book) { create(:book) }

  describe "validations" do
    it "returns false if the name is not unique" do
      test_place
      other_place = FactoryGirl.build(:place, name: "Peoria")
      expect(other_place.valid?).to eq(false)
    end
  end

  describe "add" do
    it "adds book to book_places" do
      test_place.add(test_book)
      expect(test_place.books.last).to eq(test_book)
    end
  end

  describe "toss" do
    it "removes book from book_places" do
      test_place.add(test_book)
      test_place.toss(test_book)
      expect(test_place.books).not_to include(test_book)
    end
  end

end
