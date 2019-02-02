FactoryBot.define do
  factory :schedule do
    start_date_time { 16.minutes.from_now }
    detail { 'This is a sample detail' }
    association :user

    trait :start_now do
      start_date_time { DateTime.now }
    end

    trait :start_15minutes_from_now do
      start_date_time { 15.minutes.from_now }
    end

    trait :start_nil do
      start_date_time { nil }
    end

    trait :detail_nil do
      detail { nil }
    end
  end
end
