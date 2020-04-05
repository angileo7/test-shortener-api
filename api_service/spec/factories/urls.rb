FactoryGirl.define do
  factory :url do
    original_url "MyString_long"
    short_url "MyString"
    visit_count 1
  end
end
