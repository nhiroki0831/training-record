class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string          :first_name,      null: false
      t.string          :family_name,     null: false
      t.string          :firts_name_k,    null: false
      t.string          :family_name_k,   null: false
      t.integer         :gender,          null: false
      t.date            :birthday,        null: false
      t.string          :tel,             null: false
      t.string          :postal_code,     null: false
      t.integer         :prefecture_id,   null: false
      t.string          :city,            null: false
      t.string          :address,         null: false
      t.string          :building
      t.integer         :job_id,          null: false
      t.integer         :course_id,       null: false
      t.integer         :height,          null: false
      t.references      :user,            foreign_key: true
      t.timestamps
    end
  end
end
