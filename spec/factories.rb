require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'example'
    password_confirmation 'example'
  end

  factory :seed do
    sequence(:common_name) {|n| "Corn#{n}" }
    sequence(:scientific_name) {|n| "ZeaMays#{n}" }
    hardiness_zone "4"
    additional_info "Tastey shit"
    accepted true

  end

  factory :listing do
    seed
    association :lister, factory: :user
    strain "testStrain"
    seed_quantity 24
  end

  factory :proposal do
    listing
    seed
    association :proposer, factory: :user
    strain "testStrain"
    seed_quantity 24
  end
end
