class ReplaceBloodPressureSystolicDiastolic < ActiveRecord::Migration
  def self.up
  	remove_column (:patient_visits, :blood_pressure)
  	add_column(:patient_visits, :systolic, :string)
  	add_column(:patient_visits, :diatolic, :string)
  end

  def self.down
  	add_column(:patient_visits, :blood_pressure, :string)  	
  	remove_column(:patient_visits, :systolic)
  	remove_column(:patient_visits, :diatolic)
  end
end
