FactoryBot.define do
  factory :training do
    weight             { '61.0' }
    body_fat           { '7.0' }
    blood_pressure_max { '122' }
    blood_pressure_min { '87' }
    pulse              { '74' }
    part               {["胸"]}
    association        :customer

  end
end
