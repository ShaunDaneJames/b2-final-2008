class CreateDoctorpatients < ActiveRecord::Migration[5.2]
  def change
    create_table :doctorpatients do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
