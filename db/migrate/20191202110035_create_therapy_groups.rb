class CreateTherapyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :therapy_groups do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :duration
      t.belongs_to :therapy_specialty, foreign_key: true

      t.timestamps
    end
  end
end
