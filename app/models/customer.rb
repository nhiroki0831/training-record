class Customer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :job
  belongs_to_active_hash :course

  belongs_to :user

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_k, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :family_name_k, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :gender
    validates :tel, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :height
  end
  
  validates :prefecture_id,:job_id,:course_id, numericality: { ohter_than: 1}
end