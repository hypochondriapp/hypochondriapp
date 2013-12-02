class AddActiveToSymptom < ActiveRecord::Migration
  def change
    add_column :symptoms, :active, :boolean, :default => false
  end
end
