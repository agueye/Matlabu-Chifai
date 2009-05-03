class ReplaceDoctorFirstLastWithName < ActiveRecord::Migration
  def self.up
  	remove_column (:doctors, :first_name)
  	remove_column (:doctors, :middle_name)
  	remove_column (:doctors, :last_name)
  	
  	add_column(:doctors, :name, :string)
  end

  def self.down
  	add_column(:doctors, :first_name, :string)
  	add_column(:doctors, :middle_name, :string)
  	add_column(:doctors, :last_name, :string)
  	
  	remove_column(:doctors, :name)
  
  end
end
