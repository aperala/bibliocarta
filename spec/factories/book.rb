FactoryGirl.define do
  factory :book do
    title "Godel Escher Bach"
    author "Douglas Hofstader"
    pub_date 2008 
    genre "nonfiction"
    format "pb"
    publisher "Basic Books"
    isbn "9780465026562"
    summary "Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
    Dolor, asperiores neque porro."
  end
end