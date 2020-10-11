class Customer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtendsions
  belongs_to_active_hash : prefecture_id,job_id,course_id

  validates :prefecture_id,:job_id,:course_id, numericality: { ohter_than: 1}
end