20.times do |n|
  Game.create!(
    title: Faker::Game.title,
    description: Faker::Game.platform,
    release_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    production: "制作会社#{n + 1}"
  )
end
