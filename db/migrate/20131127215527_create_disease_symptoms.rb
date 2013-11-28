class CreateDiseaseSymptoms < ActiveRecord::Migration
  def change
    create_table :disease_symptoms do |t|
      t.references :disease, index: true
      t.references :symptom, index: true

      t.timestamps
    end
  end
end
