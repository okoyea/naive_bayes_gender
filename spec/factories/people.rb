FactoryGirl.define do
  factory :person do
    gender 'male'
    height 5.9
    weight 180

    trait :female do
      gender 'female'
    end

    trait :male do
      gender 'male'
    end
  end
end