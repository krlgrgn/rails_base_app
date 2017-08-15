FactoryGirl.define do
  sequence :user_email do |n|
    "user#{n}@example.com"
  end

  sequence :first_name do |n|
    "First Name #{n}"
  end

  sequence :location do |n|
    "Location #{n}"
  end

  sequence :last_name do |n|
    "Last Name #{n}"
  end

  sequence :uid do |n|
    "uid#{n}"
  end

  sequence :provider do |n|
    "provider#{n}"
  end

  factory :user do
    email { generate(:user_email) }
    first_name { generate(:first_name) }
    last_name { generate(:last_name) }
    uid { generate(:uid) }
    provider { generate(:provider) }
    location { generate(:location) }
    image ''
    date_of_birth { 18.years.ago.at_midnight }
    password 'password'
  end
end

