require 'rails_helper'

RSpec.describe User, type: :model do

  let(:test_book) { create(:book) }
  let(:test_user) { create(:user) }
  
  describe "add" do
    it "adds book to user_books" do
      test_user.add(test_book)
      expect(test_user.books.last).to eq(test_book)
    end
  end

  describe "toss" do
    it "removes book from user_books" do
      test_user.add(test_book)
      test_user.toss(test_book)
      expect(test_user.books).not_to include(test_book)
    end
  end

end