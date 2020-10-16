class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.float      :weight,             null: false
      t.float      :body_fat,           null: false
      t.integer    :blood_pressure_max, null: false
      t.integer    :blood_pressure_min, null: false
      t.integer    :pulse,              null: false
      t.integer    :part_a_id,          null: false
      t.integer    :part_b_id
      t.text       :remarks
      t.references :customer,           foreign_key: true
      t.timestamps
    end
  end
end
