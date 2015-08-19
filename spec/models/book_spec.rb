require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:test_book) { create(:book) }
  let (:test_place) { create(:place) }

  describe "isbn_validations" do
    it "is invalid if isbn is > 13 digits" do
      test_book = FactoryGirl.build(:book, isbn: "97804650265623")
      puts test_book.isbn
      expect(test_book).not_to be_valid
    end

    it "is invalid if isbn is < 10 digits" do
      test_book = FactoryGirl.build(:book, isbn: "046502656")
      expect(test_book).not_to be_valid
    end
  end

  describe "validations" do

    it "is invalid if title is blank" do
      test_book = FactoryGirl.build(:book, title: "")
      expect(test_book.valid?).to eq(false)
    end
  end

  describe "add" do
    it "adds place to book_places" do
      test_book.add(test_place)
      expect(test_book.places.last).to eq(test_place)
    end
  end

  describe "toss" do
    it "removes place from book_places" do
      test_book.add(test_place)
      test_book.toss(test_place)
      expect(test_book.places).not_to include(test_place)
    end
  end
end