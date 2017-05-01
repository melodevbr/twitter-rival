FactoryGirl.define do
  factory :message do
    text Faker::Book.title
    user { FactoryGirl.create(:user, email: 'sonia@example.com') }
  end
end
