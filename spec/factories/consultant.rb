FactoryBot.define do
  factory :consultant do
    client
    employee { nil }
    contractor { nil }
  end
end
