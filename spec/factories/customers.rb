FactoryBot.define do
  factory :customer do
    first_name    { '竈門' }
    family_name   { '炭治郎' }
    first_name_k  { 'カマド' }
    family_name_k { 'タンジロウ' }
    gender        { '1' }
    birthday      { '1930/01/01'}
    tel           { '09012345678'}
    postal_code   { '123-4567' }
    prefecture_id { '2' }
    city          { '西多摩郡' }
    address       { '雲取山1-2-3' }
    job_id        { '2' }
    course_id     { '2' }
    height        { '165.0' }
    
  end
end
