class CreateTherapySpecialties < ActiveRecord::Migration[6.0]
  def change
    create_table :therapy_specialties do |t|
      t.string :name
      t.string :desciption

      t.timestamps
    end
  end
end
