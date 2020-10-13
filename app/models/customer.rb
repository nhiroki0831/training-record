class Customer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :job
  belongs_to_active_hash :course

  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' } 
    validates :first_name_k, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
    validates :family_name_k, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
    validates :birthday
    validates :tel, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'はハイフン(-)を使用せず数字のみ入力して下さい'}
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を使用してください'}
    validates :city
    validates :address
    validates :height, numericality: { with: /\A[0-9]+\z/ ,message: 'は半角数字のみ使用してください'}
  end
    validates :height, numericality: {greater_than_or_equal_to: 100, less_than_or_equal_to: 220 }
    validates :gender, presence: {message: 'を選択してください'} 
    validates :prefecture_id, :job_id, :course_id, numericality: { other_than: 1, message: 'を選択してください' }
 
end