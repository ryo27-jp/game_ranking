FactoryBot.define do
  factory :user do
      name {"taro"}
      email {"test@example.com"}
      password {"pass"}
      password_confirmation {"pass"}
  end
end
