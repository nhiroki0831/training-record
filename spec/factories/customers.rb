FactoryBot.define do
  factory :customer do
    first_name    { 'あああ' }
    family_name   { 'あああ' }
    first_name_k  { 'アアア' }
    family_name_k { 'アアア' }
    gender        { '1' }
    birthday      { '1930/01/01' }
    tel           { '09012345678' }
    postal_code   { '123-4567' }
    prefecture_id { '2' }
    city          { '西多摩郡' }
    address       { '雲取山1-2-3' }
    job_id        { '2' }
    course_id     { '2' }
    height        { '165.0' }
    association   :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
