class Training < ApplicationRecord

  belongs_to :customer, optional: true
  
  with_options presence: true do
    validates :weight, numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
    validates :body_fat, numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
    validates :blood_pressure_max , numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
    validates :blood_pressure_min , numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
    validates :pulse, numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
  end

    validates :part, presence: {message: 'は必ず１つ選択して下さい'} 
    validates :weight, numericality: {less_than_or_equal_to: 250 }
    validates :body_fat, numericality: {less_than_or_equal_to: 90 }
    validates :blood_pressure_max, numericality: {greater_than_or_equal_to: 60, less_than_or_equal_to: 260 }
    validates :blood_pressure_min, numericality: {greater_than_or_equal_to: 40, less_than_or_equal_to: 215 }
    validates :pulse, numericality: {greater_than_or_equal_to: 40, less_than_or_equal_to: 180 }
end