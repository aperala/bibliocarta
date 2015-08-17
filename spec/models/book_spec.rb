require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:test_book) { create(:book) }
  
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

    it "is invalid if isbn is 11 digits" do
      test_book = FactoryGirl.build(:book, isbn: "04650265679")
      expect(test_book).not_to be_valid
    end

    it "is invalid if isbn contains letters other than X" do
      test_book = FactoryGirl.build(:book, isbn: "0465026567A")
      expect(test_book).not_to be_valid
    end
  end

  describe "validations" do

    it "is invalid if title is blank" do
      test_book = FactoryGirl.build(:book, title: "")
      expect(test_book.valid?).to eq(false)
    end

  end

end