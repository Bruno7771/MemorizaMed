class CreateMedications < ActiveRecord::Migration[7.1]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dosage
      t.string :frequency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
