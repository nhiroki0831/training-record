class Training < ApplicationRecord

  belongs_to :customer
  
  with_options presence: true do
    validates :weight, numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
    validates :body_fat, numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
    validates :blood_pressure_max , numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
    validates :blood_pressure_min , numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
    validates :pulse, numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
    validates :part
  end

end