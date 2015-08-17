FactoryGirl.define do
  factory :book do
    title "Test Book"
    author "Author Name"
    pub_date 2008 
    genre "fiction"
    format "pb"
    publisher "Test Pub"
    summary "Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
    Dolor, asperiores neque porro."

    sequence :isbn do |n|
      "978393456789#{n}"
    end
  end
end