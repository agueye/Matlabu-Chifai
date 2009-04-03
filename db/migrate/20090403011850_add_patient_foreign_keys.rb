class AddPatientForeignKeys < ActiveRecord::Migration
  def self.up
    add_column :visits, :patient_id, :integer
	add_column :vaccinations, :patient_id, :integer
	add_column :allergies, :patient_id, :integer
  end

  def self.down
    remove_column :visits, :patient_id, :integer
	remove_column :vaccinations, :patient_id, :integer
	remove_column :allergies, :patient_id, :integer
  end
end
