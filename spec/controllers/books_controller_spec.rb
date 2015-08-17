require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  let(:test_book){ Book.create title: "Test Book",
                                author: "Author Name",
                                isbn: 1234, 
                                pub_date: 2008, 
                                genre: "fiction",
                                format: "pb",
                                publisher: "Test Pub",
                                summary: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                                Dolor, asperiores neque porro."
                    }
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it "assigns a new book to @book variable" do
      get :new
      book = test_book
      expect(book).to be_an_instance_of Book
    end
  end
  
end
