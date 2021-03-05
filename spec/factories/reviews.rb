FactoryBot.define do
  factory :review do
      body { "おk" }
      association :user
      association :game
  end
end
