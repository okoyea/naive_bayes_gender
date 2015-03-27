FactoryGirl.define do
  factory :person do
    gender :male
    height 5.7
    weight 185

    trait :female do
      gender :female
      height 5
      weight 115
    end

    trait :male do
      gender :male
      height 6
      weight 200
    end
  end
end