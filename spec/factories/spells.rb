FactoryBot.define do
  factory :spell do
    name { "Abracadabra" }
    category { "Useless" }
    description { "It's just for distracting people" }
    requires_wand { false }
  end
end
