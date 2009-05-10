class ChangeColumnNameDiatolicToDiastolic < ActiveRecord::Migration
  def self.up
  	rename_column (:patient_visits, :diatolic, :diastolic)
  end

  def self.down
  	rename_column (:patient_visits, :diastolic, :diatolic)
  end
end
