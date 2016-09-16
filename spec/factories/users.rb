FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'fgnl3p556w0z'
    first_name 'FirstName'
    last_name 'LastName'
    dob '1993-02-27'
    about 'about me description....'
    skills 'my skills are....'
    zip_code '97217'
    likes 'Things I like are...'
    street_address '1111 Fake Street'
    sex 'Male'
    community 'I live in _blank community'
  end
  factory(:confirmed_user) do
    after(:create) { |user| user.confirmed_at = Time.now }
  end
end
