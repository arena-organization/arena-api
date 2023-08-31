FactoryBot.define do
  factory :establishment do
    user { FactoryBot.create(:user) }
    title { 'Loren Ipsum' }
  end
end
