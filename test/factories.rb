FactoryBot.define do
  factory :assign_supporting_doc do
    user { "" }
    support_requests { "" }
  end

    factory :user do
      first_name { Faker::Name.first_name }
      last_name  { Faker::Name.last_name }
      email { Faker::Internet.email }
      phone {Faker::PhoneNumber.cell_phone}
      role {"User"}
      emergency_contact_name { Faker::Name.name  }
      emergency_contact_phone {Faker::PhoneNumber.cell_phone}
    end

    factory :support_request do
      req_type {SupportRequest::TYPES[rand(SupportRequest::TYPES.length)]}
      content { Faker::Lorem.paragraph}
      user {User.first}
    end
end