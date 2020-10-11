class Customer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :job
  belongs_to_active_hash :course

  # validates :prefecture_id,:job_id,:course_id, numericality: { ohter_than: 1}
end