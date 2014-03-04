FactoryGirl.define do
  factory :product do
    trait :tv_bonus do
      bonus_storage 'tv'
    end

    trait :tv_status do
      status_storage 'tv'
    end
  end

  factory :bonus do
    trait :sold do
      sold true
    end
  end
end
